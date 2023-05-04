import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/person_bloc.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            return Text(
                '${state is PersonLoaded ? state.person.name : 'guest'} ${state is PersonLoaded ? state.person.age.toString() : ''}');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () {
                if (context.read<PersonBloc>().state is PersonLoaded) {
                  context.read<PersonBloc>().add(const AddAgeEvent(1));
                }
              },
              child: const Text('Tambah umur'),
            ),
            ElevatedButton(
              onPressed: () {
                if (context.read<PersonBloc>().state is PersonLoaded) {
                  context
                      .read<PersonBloc>()
                      .add(UpdateNameEvent(controller.text));
                }
              },
              child: const Text('Ganti nama'),
            ),
          ],
        ),
      ),
    );
  }
}
