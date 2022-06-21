import 'package:aula_ramon/presentation/category/list_bloc/category_list_bloc_events.dart';
import 'package:aula_ramon/presentation/shared/state_type.dart';
import 'package:aula_ramon/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListBloc extends Bloc<CategoryListBlocEvent, StateType> {
  final ICategoryRepository categoryRepository;

  CategoryListBloc(this.categoryRepository) : super(EmptyState()) {
    on<CategoryListLoadingEvent>((event, emit) async => _getCategories());
    on<CategoryListSuccessEvent>((event, emit) => emit(SuccessState(event.categories)));
    on<CategoryListErrorEvent>((event, emit) => emit(ErrorState(event.message)));
  }

  Future<void> _getCategories() async {
    try {
      final result = await categoryRepository.getCategories();
      add(CategoryListSuccessEvent(result));
    } catch (exception) {
      add(CategoryListErrorEvent(exception.toString()));
    }
  }
}
