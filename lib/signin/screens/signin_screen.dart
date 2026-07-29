import 'package:bloc_package/signin/bloc/signin_bloc.dart';
import 'package:bloc_package/signin/bloc/signin_event.dart';
import 'package:bloc_package/signin/bloc/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //  text controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignIn Home'), elevation: 0),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 25),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (state is SignInValidState)
                          ? Colors.blue
                          : Colors.grey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 18,
                      ),
                    ),
                    child: const Text('Sign In'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
