import 'package:bloc_package/signin/bloc/signin_bloc.dart';
import 'package:bloc_package/signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form validation using bloc'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SignInBloc(),
                      child: const SignInScreen(),
                    ),
                  ),
                );
                // Navigator.pushNamed(context, 'singIn', arguments: {
                //   BlocProvider(
                //     create: (context) => SignInBloc(),
                //   ),
                // });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Singin with email id'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Singin with google'),
            ),
          ],
        ),
      ),
    );
  }
}
