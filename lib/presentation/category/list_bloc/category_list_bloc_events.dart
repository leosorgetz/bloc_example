import 'package:aula_ramon/models/category.dart';

abstract class CategoryListBlocEvent {}

class CategoryListEmptyEvent extends CategoryListBlocEvent {}

class CategoryListLoadingEvent extends CategoryListBlocEvent {}

class CategoryListSuccessEvent extends CategoryListBlocEvent {
  final List<Category> categories;

  CategoryListSuccessEvent(this.categories);
}

class CategoryListErrorEvent extends CategoryListBlocEvent {
  final String message;

  CategoryListErrorEvent(this.message);
}
