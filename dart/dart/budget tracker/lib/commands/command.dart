abstract class Command {
  String execute();

  bool validate(String input);

  void parse(String input);
}
