import 'package:get/get.dart';
import 'package:getx_example/models/Book.dart';

class BookController extends GetxController {
  var books = <Book>[
    Book(
      title: 'El Señor de los Anillos',
      author: 'J.R.R. Tolkien',
      price: 20,
      description: 'Una épica historia de aventuras en un mundo de fantasía creado por J.R.R. Tolkien.',
    ),
    Book(
      title: 'Cien años de soledad',
      author: 'Gabriel García Márquez',
      price: 15,
      description: 'Un clásico de la literatura latinoamericana que narra la historia de la familia Buendía y su mágico pueblo de Macondo.',
    ),
    Book(
      title: 'Harry Potter y la piedra filosofal',
      author: 'J.K. Rowling',
      price: 18,
      description: 'El primer libro de la famosa serie de Harry Potter, que sigue las aventuras del joven mago Harry Potter y sus amigos en la escuela de magia Hogwarts.',
    ),
  ].obs;


  var cart = <Book>[].obs;

  void addToCart(Book book) {
    if (!cart.contains(book)) {
      cart.add(book);
      Get.snackbar('Añadido al carrito', '${book.title} añadido al carrito.');
    } else {
      Get.snackbar('Ya en el carrito', '${book.title} ya está en el carrito.');
    }
  }

  void removeFromCart(Book book) {
    if (cart.contains(book)) {
      cart.remove(book);
      Get.snackbar('Eliminado del carrito', '${book.title} eliminado del carrito.');
    } else {
      Get.snackbar('No está en el carrito', '${book.title} no está en el carrito.');
    }
  }
}


