import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/person_bloc.dart';
import 'view/pages/login_page.dart';
import 'view/pages/main_page.dart';
import 'view/widgets/bold_text.dart';
import 'view/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // minta fungsi yang kembaliannya Bloc
      create: (context) => PersonBloc(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
