import 'package:firebase_task/Constant/MyColors.dart';
import 'package:firebase_task/UI/HomePage/widgets/WeightItem.dart';
import 'package:firebase_task/core/Blocs/Home/home_page_cubit.dart';
import 'package:firebase_task/core/Blocs/Users/users_cubit.dart';
import 'package:firebase_task/core/utils/Function/MyToast.dart';
import 'package:firebase_task/core/utils/Widgets/ShowLoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Auth/LoginScreen.dart';

class CreateWeight extends StatelessWidget {
  const CreateWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myDarkBlue,
        title: const Text('Firebase FireStore'),
        actions: [
          IconButton(
              onPressed: ()  {
                UsersCubit.get(context).signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Login()),
                );
              },
              icon: const Icon(Icons.output))
        ],
      ),
      body: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            if (state is HomePageDataLoading) {
              return const ShowLoadingIndicator();
            } else if (state is HomePageDataGetSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: HomePageCubit.get(context).homeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Enter Weight',
                            suffixIcon: TextButton(
                              child: Text(
                                  HomePageCubit.get(context).selectedWeight ==
                                          null
                                      ? "Save"
                                      : 'Update'),
                              onPressed: () {
                                if (HomePageCubit.get(context)
                                    .homeController
                                    .text
                                    .isEmpty) {
                                  MyToast.myToastShow(
                                      "Please Inter The Weight", Colors.red);
                                } else {
                                  HomePageCubit.get(context).addWeight();
                                }
                              },
                            )),
                      ),
                      Expanded(
                          child: RefreshIndicator(
                        onRefresh: () async {
                          HomePageCubit.get(context).getDate();
                        },
                        child: ListView.separated(
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: WeightItem(
                                    item: HomePageCubit.get(context)
                                        .weightTwo![index],
                                  ),
                                ),
                            separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 1,
                                    color: Colors.grey[300],
                                  ),
                                ),
                            itemCount:
                                HomePageCubit.get(context).weightTwo!.length),
                      ))
                    ],
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
