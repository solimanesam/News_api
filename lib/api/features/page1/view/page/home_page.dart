import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/api/features/page1/controller/cubit/home_cubit.dart';
import 'package:news_api/api/features/page1/view/components/home_body.dart';

// ignore: camel_case_types
class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
       
        },
        builder: (context, state) {
          return Scaffold(
            body:
             state is Homeloading?const Center(child: CircularProgressIndicator(),): 
             RefreshIndicator(onRefresh: HomeCubit.homecubitinstance.getnews, child:const home_body()),
             
            appBar: AppBar(
              centerTitle: true,
              title: const Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "News",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "App",
                  style: TextStyle(color: Colors.red),
                )
              ]),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          );
        },
      ),
    );
  }
}
