import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/api/core/constants/V_constants.dart';
import 'package:news_api/api/features/page1/controller/cubit/category_cubit_cubit.dart';
import 'package:news_api/api/features/page1/model/home-model.dart';
import 'package:url_launcher/url_launcher.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getnews();
    checkconnctivty();
  }
  static final HomeCubit homecubitinstance = HomeCubit();
  List<home_model> home_news = [];
  Future<void> getnews() async {
    emit(Homeloading());
    Response response = await http.get(
      Uri.parse(
          'https://saurav.tech/NewsAPI/top-headlines/category/general/gb.json'),
    );
    var responsedata = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
     final List decodedJson = responsedata['articles'] as List;
     home_news = decodedJson.map<home_model>((news) => home_model.fromjson(data: news)).toList();
      // for (var news in responsedata['articles']) {
      //   home_news.add(home_model.fromjson(data: news));
      //}
      emit(HomeSuccess());
    } else {
      emit(HomeFailed());
    }
  }

  void changeCategory(String newCategory) async {
    category = newCategory;
    CategoryCubitCubit.cubitinstance.getcategorynews();
    emit(changeNews());
    print(category);
  }

  Future<void> launchurl({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      emit(HomeSuccess());
    } else {
      throw 'Could not launch $url';
    }
  }
  List<ConnectivityResult>? result;
  void checkconnctivty()async{
    result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
    emit(Connected());
  }else{
    emit(NotConnected());
  }
 
  }
}
