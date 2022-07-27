import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_task/core/Blocs/Home/home_page_cubit.dart';
import 'package:firebase_task/core/Blocs/Users/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/Auth/LoginScreen.dart';
import 'UI/HomePage/HowePage.dart';
import 'core/utils/Function/show.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersCubit>(create: (context) => UsersCubit()),
        BlocProvider<HomePageCubit>(create: (context) => HomePageCubit()..getDate()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              ShowIndicator.showIndicator();
            } else if (snapshot.hasData) {
              return const CreateWeight();
            } else if (snapshot.hasError) {
              return Container(color: Colors.red,);
            } else {
              return const Login();
            }
            return Container(color: Colors.orange,);
          },
        ),
      ),
    );
  }
}