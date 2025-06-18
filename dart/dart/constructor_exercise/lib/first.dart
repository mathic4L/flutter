class Book {
  Book(this.title, this.author, this.publicationYear);

  Book.untitled(this.author, this.publicationYear) : title = 'Untitled';

  factory Book.fromJson(Map<String, dynamic> src) {
    try {
      final String title = src['title'];
      if (title == 'Singleton') {}
      final String author = src['author'];
      final int publicationYear = src['publicationYear'];
      return Book(title, author, publicationYear);
    } on Exception catch (e) {
      throw ArgumentError(e);
    }
  }

  String title;
  String author;
  int publicationYear;
  static final Book _singletonBook = Book('Singleton', 'placeholder', 1999);

  /*
  Book("1984", by George Orwell, 1949)
   */
  @override
  String toString() {
    return 'Book("$title", by $author, $publicationYear)';
  }
}
