import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_api/api/features/page1/model/news-model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

 static void getX(int index){
    Newsmodel.fromjson(index: index);
  }
}
