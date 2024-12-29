import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:news_api/api/core/constants/V_constants.dart';
import 'package:news_api/api/features/page1/model/category-model%20.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

part 'category_cubit_state.dart';

class CategoryCubitCubit extends Cubit<CategoryCubitState> {
  CategoryCubitCubit() : super(CategoryCubitInitial()) {
    getcategorynews();
  }
  static final CategoryCubitCubit cubitinstance = CategoryCubitCubit();
  List<category_model> category_news = [];
  Future<void> getcategorynews() async {
    emit(CategoryLoading());
    Response response = await http.get(
      Uri.parse(
          'https://saurav.tech/NewsAPI/top-headlines/category/$category/gb.json'),
    );
    var responsedata = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      for (var news in responsedata['articles']) {
        category_news.add(category_model.fromjson(data: news));
      }
      emit(CategorySuccess());
    } else {
      emit(CategoryFailed());
    }
  }

  Future<void> launchurl({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      emit(CategorySuccess());
    } else {
      throw 'Could not launch $url';
    }
  }
  
}
