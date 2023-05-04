// import 'package:bahas_uts/person.dart';
// import 'package:bahas_uts/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/view/widgets/bold_text.dart';
import 'package:flutter_application_bloc/view/pages/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/person_bloc.dart';
import 'login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // semua yang membutuhkan PersonBloc
        // dapat menggunakan BlcoBuilder
        title: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            return Text(
                'Hello ${state is PersonLoaded ? state.person.name : ''}');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nama anda'),
            BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) {
                return state is PersonLoaded
                    // ? Text(state.person.name.toString())
                    ? BoldText(teks: state.person.name)
                    : state is PersonLoading
                        ? const CircularProgressIndicator()
                        : const Text('No data');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Umur saat ini adalah'),
            // semua yang membutuhkan PersonBloc
            // dapat menggunakan BlcoBuilder
            BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) {
                // ketika statenya PersonLoaded maka muncul age
                // ketika statenya PersonLoading maka muncul
                // CircularProgressIndicator() jika tidak berarti no data
                return state is PersonLoaded
                    ? BoldText(teks: state.person.age.toString())
                    : state is PersonLoading
                        ? const CircularProgressIndicator()
                        : const Text('No data');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<PersonBloc>().add(LogoutEvent());
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: const Text('Logout')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ));
                },
                child: const Text('Edit Profile'))
          ],
        ),
      ),
    );
  }
}
