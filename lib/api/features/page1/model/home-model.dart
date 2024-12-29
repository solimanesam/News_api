// ignore: camel_case_types
class home_model {
  String? title ,subtitle ,image , link;
   home_model({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.link,
  });
  home_model.fromjson({required Map<String,dynamic> data}){
    title = data['title'];
    subtitle = data['description'];
    image = data['urlToImage'];
    link = data['url'];
  }
}