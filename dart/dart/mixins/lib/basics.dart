mixin MyMixin {
  String name = 'MyMixin';

  void set name(String value) {
    name = value;
  }
  void printName() {
    print(name);
  }
}