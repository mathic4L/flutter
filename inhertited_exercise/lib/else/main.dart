import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

void incrementByOne(ChangeableThemeInherited customInherited) {
  setState(() {

  });
}

void incrementByHalf(ChangeableThemeInherited customInherited) {
  setState(() {

  });

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /*
  used to perform expensive calculations that happens on dependencies change only
    so that they are not executed every rebuild
   */
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return data - (oldWidget as _ChangeableThemeInherited).data <= 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body:
        ,),
    );
  }
  /*
  conventional method
  calls '.maybeOf' and asserts its return != null
   */
  static ChangeableThemeInherited of(BuildContext context) {
    final output = maybeOf(context);
    assert(output != null, 'no CustomInherited found');
    return output!;
  }

  /*
  conventional method
  returns nullable instance of this Inherited
   */
  static ChangeableThemeInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChangeableThemeInherited>();
  }
}
