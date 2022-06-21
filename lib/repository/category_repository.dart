
import 'package:aula_ramon/models/category.dart';

abstract class ICategoryRepository {
  Future<List<Category>> getCategories();
}

class CategoryRepository implements ICategoryRepository {
  CategoryRepository();

  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    // throw Exception('Ocorreu um erro, tente novamente mais tarde.');
    return [
      Category(name: 'Categoria 1'),
      Category(name: 'Categoria 2'),
      Category(name: 'Categoria 3'),
      Category(name: 'Categoria 4'),
      Category(name: 'Categoria 5'),
    ];
  }
}
