final String topLevelFinal = initTopLevel();

String initTopLevel() {
  print('Top-level final initialized');
  return 'top';
}

class Demo {
  static final String staticFinal = initStaticFinal();
  static String staticVar = initStaticVar();

  final String instanceFinal;
  String instanceVar = initInstanceVar();

  Demo() : instanceFinal = initInstanceFinal() {
    print('Constructor body executed');
  }

  static String initStaticFinal() {
    print('Static final initialized');
    return 'staticFinal';
  }

  static String initStaticVar() {
    print('Static var initialized');
    return 'staticVar';
  }

  static String initInstanceFinal() {
    print('Instance final initialized');
    return 'instanceFinal';
  }

  static String initInstanceVar() {
    print('Instance var initialized');
    return 'instanceVar';
  }
}

void first() {
  print('Program started');
  final demo = Demo();
}

