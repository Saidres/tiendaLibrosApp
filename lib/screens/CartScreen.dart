import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/BookController.dart';
import 'package:getx_example/models/Book.dart';
import 'package:getx_example/screens/CartItemDetailDialog.dart';

class CartScreen extends StatelessWidget {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: bookController.cart.length,
          itemBuilder: (context, index) {
            final book = bookController.cart[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              trailing: Text('\$${book.price.toStringAsFixed(2)}'),
              onTap: () {
                _showCartItemDetailDialog(context, book);
              },
            );
          },
        ),
      ),
    );
  }

  void _showCartItemDetailDialog(BuildContext context, Book book) async {
    bool? result = await showDialog(
      context: context,
      builder: (context) => CartItemDetailDialog(book: book),
    );

    if (result != null && result) {
      bookController.removeFromCart(book);
    }
  }
}
