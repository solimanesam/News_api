import 'package:news_api/api/features/page1/controller/cubit/home_cubit.dart';

class Newsmodel {

 static String? image,title,subtitle;
  Newsmodel({required title ,required subtitle ,required image});
  
  Newsmodel.fromjson({required int index}){
    title =HomeCubit.homecubitinstance.home_news[index].title ;
    subtitle = HomeCubit.homecubitinstance.home_news[index].subtitle;
    image = HomeCubit.homecubitinstance.home_news[index].image; 
}
}