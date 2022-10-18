
class Books {
  String? error;
  String? total;
  List<Book>? bookList;

  Books({this.error, this.total, this.bookList});

  Books.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    total = json['total'];
    if (json['books'] != null) {
      bookList = <Book>[];
      json['books'].forEach((v) {
        // ignore: unnecessary_new
        bookList!.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error;
    data['total'] = total;
    if (bookList != null) {
      data['books'] = bookList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  Book(
      {this.title,
      this.subtitle,
      this.isbn13,
      this.price,
      this.image,
      this.url});

  Book.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['isbn13'] = isbn13;
    data['price'] = price;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}