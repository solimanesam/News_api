import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/api/features/page1/controller/cubit/home_cubit.dart';
import 'package:news_api/api/features/page1/controller/home_controller.dart';
import 'package:news_api/api/features/page1/view/components/Articles.dart';
import 'package:news_api/api/features/page1/view/page/category_page.dart';

// ignore: camel_case_types
class home_body extends StatelessWidget {
  const home_body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed')),
            );
          }
           if (state is NotConnected) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Not Connected with internet')),
            );
          }
        },
        builder: (context, state) {
          return
              // state is Homeloading?
              //  const Center(
              //   child: CircularProgressIndicator(),
              // ):

              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 95,
                    child: ListView.builder(
                      itemCount: home_controller.cat.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GestureDetector(
                            onTap: () {
                              HomeCubit.homecubitinstance.changeCategory(home_controller.cat[index]['word']);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const category_page(),
                              ));
                            },
                            child: Container(
                              height: 95,
                              width: 180,
                              padding: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          home_controller.cat[index]['im'])),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                  child: Text(
                                home_controller.cat[index]['word'],
                                style: const TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 32,
                )),
                const Articles()
              ],
            ),
          );
        },
      ),
    );
  }
}
