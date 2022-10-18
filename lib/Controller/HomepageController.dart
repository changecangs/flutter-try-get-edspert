import 'package:book_app_edspert/Model/Book_Detail.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:book_app_edspert/Model/Books.dart';
import 'package:book_app_edspert/Model/Book_Detail.dart';
import 'package:book_app_edspert/AppString.dart';
import 'dart:convert';

class HomePageController extends ChangeNotifier{
  Books? bookGet;
  fetchBooks() async {
    var url = Uri.parse(AppString().getAPIListBooksURL);
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final jsonBookList = jsonDecode(response.body);
      bookGet = Books.fromJson(jsonBookList);
      notifyListeners();
    }
  }
  BookDetail? detailBookGet;
  fetchBookDetail(String isbn) async {
    var url = Uri.parse(AppString().getAPIDetailBooksURL + isbn);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonDetail = jsonDecode(response.body);
      detailBookGet = BookDetail.fromJson(jsonDetail);
      notifyListeners();
    }
  }
}