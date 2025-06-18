
void interpolation() {
  int west = 3000000000;
  int east = 7000000000;
  /*
  implicit toString()
   */
  String greeting = "hello world's ${west + east} people!";
  print(greeting);
}

void concatenationByPlus() {
  String str = "hello " + "world!" + "!";
  print(str);
}

void concatenationOfAdjacent() {
  String str = "hello ""world!"
      "!";
  print(str);
}

void multiLine() {
  String str = """
  hello
  world!
  """;
  print(str);
}

void raw() {
  String str = r"hello \n world!";
  print(str);
}