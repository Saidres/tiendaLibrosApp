import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/BookController.dart';
import 'package:getx_example/models/Book.dart';
import 'package:getx_example/screens/BookDetailDialog.dart';
import 'package:getx_example/screens/CartScreen.dart';

class BookListScreen extends StatelessWidget {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Libros'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              _navigateToCart(context);
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: bookController.books.length,
          itemBuilder: (context, index) {
            final book = bookController.books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              trailing: Text('\$${book.price.toStringAsFixed(2)}'),
              onTap: () {
                _showBookDetailDialog(context, book);
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToCart(BuildContext context) {
    Get.to(CartScreen());
  }

  void _showBookDetailDialog(BuildContext context, Book book) async {
    bool? result = await showDialog(
      context: context,
      builder: (context) => BookDetailDialog(book: book),
    );

    if (result != null && result) {
      bookController.addToCart(book);
    }
  }
}
