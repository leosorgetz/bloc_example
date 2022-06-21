import 'package:aula_ramon/presentation/category/list_bloc/category_list_bloc_page.dart';
import 'package:aula_ramon/presentation/category/list_cubit/category_list_cubit_page.dart';
import 'package:flutter/material.dart';

class ChoseExamplePage extends StatelessWidget {
  final String title;

  const ChoseExamplePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              context: context,
              text: 'BLoC',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryListBlocPage(
                      title: 'Flutter Demo BLoC',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildButton(
              context: context,
              text: 'Cubit',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryListCubitPage(
                      title: 'Flutter Demo Cubit',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Function() onPressed,
  }) =>
      MaterialButton(
        color: Colors.blue,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      );
}
