void finall() {}

final class Message {
  Message(this.content);

  String content;
}

base class OfficialMessage extends Message{
  OfficialMessage(super.content);

}
