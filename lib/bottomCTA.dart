import "package:flutter/material.dart";

main() {
  runApp(MaterialApp(
    home: Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomCta(
        separated: true,
        cta: Text("test"),
        ctaDescr: Text("Descr"),
        onPressed: () {},
      ),
    ),
  ));
}

class BottomCta extends StatelessWidget {
  const BottomCta({super.key, required this.onPressed, required this.cta, this.ctaDescr, this.separated = true});

  final VoidCallback onPressed;
  final Widget cta;
  final Widget? ctaDescr;
  final bool separated;

  Widget get child {
    switch (separated) {
      case true:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ctaDescr != null) ctaDescr!,
            FilledButton(onPressed: onPressed, child: cta)],
        );
      case false:
        return FilledButton(
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cta,
              if(ctaDescr != null) ctaDescr!
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: BottomAppBar(
          child: child
      ),
    );
  }

}