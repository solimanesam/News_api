import 'package:flutter/material.dart';
import 'package:news_api/api/features/page1/controller/cubit/home_cubit.dart';

// ignore: must_be_immutable
class Articles extends StatelessWidget {
   const Articles({super.key,});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: HomeCubit.homecubitinstance.home_news.length,
            (context, index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: GestureDetector(
                onTap: () {
                  HomeCubit.homecubitinstance.launchurl(url: HomeCubit.homecubitinstance.home_news[index].link! );

                  // NewsCubit.getX(index);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => News_page(),
                  // ));
                },
                child: Image.network(
                  HomeCubit.homecubitinstance.home_news[index].image ??
                      'https://www.pngarts.com/files/4/Exclamation-Mark-PNG-Image-Transparent.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 160,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Padding(
                     padding: EdgeInsets.symmetric(vertical: 70),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 70),
                      child: Text('Failed To Upload This Photo'),
                    );
                  },
                )),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            HomeCubit.homecubitinstance.home_news[index].title ?? '',
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
            HomeCubit.homecubitinstance.home_news[index].subtitle ?? '',
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
    }));
  }
}
