import 'package:aula_ramon/models/category.dart';
import 'package:aula_ramon/presentation/category/list_bloc/category_list_bloc.dart';
import 'package:aula_ramon/presentation/category/list_bloc/category_list_bloc_events.dart';
import 'package:aula_ramon/presentation/shared/state_type.dart';
import 'package:aula_ramon/repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListBlocPage extends StatefulWidget {
  const CategoryListBlocPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CategoryListBlocPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListBlocPage> {
  final categoryListBloc = CategoryListBloc(CategoryRepository());

  @override
  void initState() {
    super.initState();
    categoryListBloc.add(CategoryListLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CategoryListBloc, StateType>(
        bloc: categoryListBloc,
        builder: (context, state) {
          if (state is SuccessState<List<Category>>) return _buildSuccess(state);
          if (state is ErrorState) return _buildError(state);
          return _buildLoading();
        },
      ),
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
