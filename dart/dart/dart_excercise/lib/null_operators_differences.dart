void nullOperatorsDifferences(){
  String? message;

  message?.toUpperCase(); // null
  message!.toUpperCase(); // exception 
}