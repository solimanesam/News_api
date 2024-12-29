import 'dart:convert';

import 'package:news_api/api/core/failure/exception.dart';
import 'package:news_api/api/features/getnews/data/model/news_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<NewsModel>> getNews(String category);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});
  @override
  Future<List<NewsModel>> getNews(String category) async {
    Response response = await client.get(
      Uri.parse(
          'https://saurav.tech/NewsAPI/top-headlines/category/$category/gb.json'),
    );
    var responsedata = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      final List decodedJson = responsedata['articles'] as List;
      final List<NewsModel> homenews = decodedJson
          .map<NewsModel>((news) => NewsModel.fromjson(news))
          .toList();

      return homenews;
    } else {
      throw ServerException();
    }
  }
}
