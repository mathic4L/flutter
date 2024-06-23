import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CustomScrollableWidget(
      children: Map.fromEntries(
        List.generate(10, (index) {
          final sectionTitle = 'Section ${index + 1}';
          final widgets = List.generate(
            3,
                (widgetIndex) => Text('Widget ${index * 2 + widgetIndex + 1}'),
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

  CustomScrollableWidget({required this.children, this.showBackButton = false});

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
        child: Row(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Page Title"),
                  ),
                  ...widget.children.entries.map((entry) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(entry.value),
                        ),
                        ...entry.key,
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            SizedBox(
              width: 512,
              child: Stack(
                children: [
                  Positioned(
                      left: 0, top: 32,
                      child: Container(width: 4, height: 512, color: Colors.grey,)
                  ),
                  Column(
                    key: _wrapKey,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Content Table"),
                      ...widget.children.values.map((title) {
                        return GestureDetector(
                          onTap: () {
                            _scrollToSection(title);
                          },
                          child: Row(
                            children: [
                              Container(width: 4, height: 24, color: Colors.black,),
                              SizedBox(width: 16),
                              Text(title),
                            ],
                          )  ,
                        );
                      }).toList()
                    ],
                  ),
                ]
              )
            ),
          ],
        ),
      ),
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
