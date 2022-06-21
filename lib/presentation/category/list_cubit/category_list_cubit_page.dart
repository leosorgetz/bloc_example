import 'package:aula_ramon/models/category.dart';
import 'package:aula_ramon/presentation/category/list_cubit/category_list_cubit.dart';
import 'package:aula_ramon/presentation/shared/state_type.dart';
import 'package:aula_ramon/repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListCubitPage extends StatefulWidget {
  const CategoryListCubitPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CategoryListCubitPage> createState() => _CategoryListCubitPageState();
}

class _CategoryListCubitPageState extends State<CategoryListCubitPage> {
  final categoryListCubit = CategoryListCubit(CategoryRepository());

  @override
  void initState() {
    super.initState();
    categoryListCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CategoryListCubit, StateType>(
        bloc: categoryListCubit,
        builder: (context, state) {
          if (state is SuccessState<List<Category>>) return _buildSuccess(state);
          if (state is ErrorState) return _buildError(state);
          return _buildLoading();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: categoryListCubit.getCategories,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildSuccess(SuccessState<List<Category>> state) {
    return ListView.builder(
      itemCount: state.result.length,
      itemBuilder: (context, index) {
        final category = state.result[index];
        return ListTile(
          title: Text(category.name),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildError(ErrorState state) => Center(
        child: Text(
          state.message,
          style: Theme.of(context).textTheme.headline4,
        ),
      );

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );
}
