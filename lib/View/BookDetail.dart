import 'package:book_app_edspert/Controller/HomepageController.dart';
import 'package:book_app_edspert/Controller/BookDetailController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BookDetail extends StatefulWidget{
  const BookDetail({Key? key, required this.isbn}) : super(key: key);
  final String isbn;
  @override
  State<BookDetail> createState() => _BookDetail();
}

class _BookDetail extends State<BookDetail> {
  HomePageController? controller;
  @override
  void initState() {
    super.initState();
    controller = Provider.of<HomePageController>(context, listen: false);
    controller!.fetchBookDetail(widget.isbn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Detail' ))),
      body: Consumer<HomePageController>(builder: (context, controller, child){
        return controller.detailBookGet == null ? const Center(child: CircularProgressIndicator())
          : Padding(
            padding : const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      controller!.detailBookGet!.image!,
                      height: 200
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.detailBookGet!.title!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              controller.detailBookGet!.authors!,
                              style: const TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: List.generate(
                                5,
                                    (index) => Icon(
                                  Icons.star,
                                  color: index <
                                      int.parse(controller
                                          .detailBookGet!.rating!)
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              controller.detailBookGet!.subtitle!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              controller.detailBookGet!.price!,
                              style: const TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

          );
    },
    ));
  }
}