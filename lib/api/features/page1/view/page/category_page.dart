import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/api/features/page1/controller/cubit/category_cubit_cubit.dart';

class category_page extends StatelessWidget {
  const category_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubitCubit(),
      child: BlocBuilder<CategoryCubitCubit, CategoryCubitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    CategoryCubitCubit.cubitinstance.category_news.clear();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: state is CategoryLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(onRefresh: CategoryCubitCubit.cubitinstance.getcategorynews,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  childCount: CategoryCubitCubit.cubitinstance
                                      .category_news.length, (context, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: GestureDetector(
                                    onTap: () {
                                       CategoryCubitCubit.cubitinstance.launchurl(url: CategoryCubitCubit.cubitinstance.category_news[index].link! );
                                    },
                                    child: Image.network(
                                      CategoryCubitCubit.cubitinstance
                                              .category_news[index].image ??
                                          'https://www.pngarts.com/files/4/Exclamation-Mark-PNG-Image-Transparent.png',
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      height: 160,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return const Padding(
                                           padding: EdgeInsets.symmetric(vertical: 70),
                                          child: Center(
                                              child: CircularProgressIndicator()),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 70),
                                          child: Text(
                                              'Failed To Upload This Photo'),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  CategoryCubitCubit.cubitinstance
                                          .category_news[index].title ??
                                      '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                  CategoryCubitCubit.cubitinstance
                                          .category_news[index].subtitle ??
                                      '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }))
                        ],
                      ),
                    ),
                ),
          );
        },
      ),
    );
  }
}
