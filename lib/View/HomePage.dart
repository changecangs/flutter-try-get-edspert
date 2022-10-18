import 'package:book_app_edspert/Controller/HomepageController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  HomePageController? homePageController;
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    homePageController = Provider.of<HomePageController>(context, listen: false);
    homePageController!.fetchBooks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Book Catalog'))),
      body: Consumer<HomePageController>(
        builder: (context,controller, child) => Container(
          child: ListView.builder(
              itemCount: homePageController!.bookGet!.bookList!.length,
              itemBuilder: (context, index) {
                final currentBook = homePageController!.bookGet!.bookList![index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) =>
                    //         DetailBookPage(isbn: currentBook.isbn13!)));
                  },
                  child: Row(
                    children: [
                      Image.network(
                        currentBook.image!,
                        height: 250,
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(currentBook.title!),
                              Text(currentBook.subtitle!),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
          ),
        ),
      );
  }

}