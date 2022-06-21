import 'package:aula_ramon/presentation/shared/state_type.dart';
import 'package:aula_ramon/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListCubit extends Cubit<StateType> {
  final ICategoryRepository categoryRepository;

  CategoryListCubit(this.categoryRepository) : super(EmptyState());

  Future<void> getCategories() async {
    try {
      emit(LoadingState());
      final result = await categoryRepository.getCategories();
      emit(SuccessState(result));
    } catch (exception) {
      emit(ErrorState(exception.toString()));
    }
  }
}
