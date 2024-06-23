import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CustomScrollableWidget(
      horizontalScroll: true,
      children: Map.fromEntries(
        List.generate(20, (index) {
          final sectionTitle = 'Section ${index + 1}';
          final widgets = List.generate(10, (widgetIndex) => Text('Widget ${index * 10 + widgetIndex + 1}  '),
          );
          return MapEntry(widgets, sectionTitle);
        }),
      ),
      showBackButton: true,
    ),
  ));
}

class CustomScrollableWidget extends StatefulWidget {
  final Map<List<Widget>, String> children;
  final bool showBackButton;
  final bool horizontalScroll;

  CustomScrollableWidget({required this.children, this.showBackButton = false, this.horizontalScroll = false});

  @override
  _CustomScrollableWidgetState createState() => _CustomScrollableWidgetState();
}

class _CustomScrollableWidgetState extends State<CustomScrollableWidget> {
  ScrollController _scrollController = ScrollController();
  bool showBottomList = false;
  final GlobalKey _wrapKey = GlobalKey();
  final GlobalKey _bottomBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            double pixels = notification.metrics.pixels;
            double maxScrollExtent = _scrollController.position.maxScrollExtent;

            // Get the height of the wrapped chips list
            final RenderBox renderBox = _wrapKey.currentContext?.findRenderObject() as RenderBox;
            final double wrapHeight = renderBox.size.height;

            setState(() {
              showBottomList = pixels >= wrapHeight;
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Page Title"),
              ),
              Wrap(
                key: _wrapKey,
                children: widget.children.values.map((title) {
                  return ChoiceChip(
                    label: Text(title),
                    selected: false, // Set this based on the current section
                    onSelected: (selected) {
                      // Scroll to the corresponding section
                      _scrollToSection(title);
                    },
                  );
                }).toList(),
              ),
              ...widget.children.entries.map((entry) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(entry.value),
                    ),
                    if(widget.horizontalScroll)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: entry.key,
                        ),
                      ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: showBottomList
          ? BottomAppBar(
              key: _bottomBarKey,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Container(
                    child: PopupMenuButton<String>(
                      onSelected: (selectedSection) {
                        // Scroll to the corresponding section
                        _scrollToSection(selectedSection);
                      },
                      itemBuilder: (BuildContext context) {
                        return widget.children.values.map((title) {
                          return PopupMenuItem<String>(
                            value: title,
                            child: Text(title),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.children.values.map((title) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              label: Text(title),
                              selected: false, // Set this based on the current section
                              onSelected: (selected) {
                                // Scroll to the corresponding section
                                _scrollToSection(title);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  void _scrollToSection(String title) {
    // Find the index of the section
    int index = widget.children.values.toList().indexOf(title);

    // Calculate the offset based on the index
    double offset = 0.0;
    for (int i = 0; i < index; i++) {
      offset += _getHeightOfSection(i);
    }

    // Scroll to the section
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  double _getHeightOfSection(int index) {
    // Calculate the height of each section based on the number of widgets in it
    int widgetCount = widget.children.keys.elementAt(index).length;
    return (widgetCount * 50.0) + 40.0; // Assuming each widget has a height of 50.0 and adding extra padding
  }
}
