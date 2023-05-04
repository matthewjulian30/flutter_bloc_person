import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_bloc/view/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/person_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controllerName,
              ),
              TextField(
                controller: controllerPassword,
                obscureText: true,
                obscuringCharacter: '*',
              ),
              ElevatedButton(
                  onPressed: () {
                    // context.read<PersonBloc>
                    // digunakan untuk mendapatkan instance dari
                    // widget diatasnya
                    if (controllerName.text != '' &&
                        controllerPassword.text != '') {
                      context.read<PersonBloc>().add(LoginEvent(
                          controllerName.text, controllerPassword.text));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ));
                    }
                  },
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
