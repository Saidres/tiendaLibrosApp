import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/Book.dart';


class BookDetailDialog extends StatelessWidget {
  final Book book;

  const BookDetailDialog({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(book.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Autor: ${book.author}'),
          SizedBox(height: 10),
          Text('Precio: \$${book.price.toStringAsFixed(2)}'),
          SizedBox(height: 10),
          Text('Descripción: ${book.description}'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text('Añadir al Carrito'),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}
