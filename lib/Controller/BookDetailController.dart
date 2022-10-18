import 'package:book_app_edspert/Model/Book_Detail.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:book_app_edspert/Model/Books.dart';
import 'package:book_app_edspert/Model/Book_Detail.dart';
import 'package:book_app_edspert/AppString.dart';
import 'dart:convert';
class BookDetailController extends ChangeNotifier{
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