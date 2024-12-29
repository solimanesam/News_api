import 'package:news_api/api/features/getnews/domain/entities/entity_model.dart';

class NewsModel extends EntityModel {
  const NewsModel(
      {required super.title,
      required super.subtitle,
      required super.image,
      required super.link});
  factory NewsModel.fromjson(Map<String, dynamic> data) => NewsModel(
      title: data['title'],
      subtitle: data['description'],
      image: data['urlToImage'],
      link: data['url']);
}
