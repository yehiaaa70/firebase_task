import 'package:firebase_task/core/Blocs/Users/users_cubit.dart';
import 'package:firebase_task/core/utils/Function/MyToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constant/MyColors.dart';
import '../../core/utils/Widgets/MyButton.dart';
import '../HomePage/HowePage.dart';
import 'Registeration.dart';
import 'Widgets/PasswordTextForm.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UsersCubit, UsersState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 12, right: 12),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/firebase_image.png",
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 35.0),
                            TextFormField(
                              controller:
                                  UsersCubit.get(context).emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle_rounded,
                                  color: MyColors.myDarkBlue,
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors.myDarkBlue),
                                ),
                                labelText: "Email",
                                labelStyle:
                                    TextStyle(color: MyColors.myDarkBlue),
                                alignLabelWithHint: true,
                              ),
                            ),
                            const SizedBox(height: 35.0),
                            PasswordField(
                              controller:
                                  UsersCubit.get(context).passwordController,
                              fieldKey: _passwordFieldKey,
                              helperText: 'Only8 Characters',
                              labelText: 'Password',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 18,
                          right: 18,
                          bottom: (MediaQuery.of(context).size.height / 4)),
                      child: Column(
                        children: [
                          MyButton(
                              text: "Sign In",
                              onClick: () {
                                if (UsersCubit.get(context)
                                        .emailController
                                        .text
                                        .isNotEmpty &&
                                    UsersCubit.get(context)
                                        .passwordController
                                        .text
                                        .isNotEmpty) {
                                  UsersCubit.get(context).signInWithEmail();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateWeight()),
                                  );
                                } else {
                                  MyToast.myToastShow(
                                      "Please Complete The Form", Colors.red);
                                }
                              }),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have account ?",
                                style:  TextStyle(fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()),
                                  );
                                },
                                child: const Text(
                                  "SignUp",
                                  style:  TextStyle(
                                      color: MyColors.myBlue, fontSize: 16),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
