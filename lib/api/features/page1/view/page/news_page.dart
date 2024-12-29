import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/api/features/page1/controller/cubit/news_cubit.dart';
import 'package:news_api/api/features/page1/model/news-model.dart';

// ignore: must_be_immutable
class News_page extends StatelessWidget {
  const News_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => NewsCubit(),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
           
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                       Newsmodel.image ??
                            'https://png.pngtree.com/png-clipart/20230815/original/pngtree-danger-exclamation-sign-advice-alarm-picture-image_7945215.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 160,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                     Newsmodel.title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                     Newsmodel.subtitle ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
