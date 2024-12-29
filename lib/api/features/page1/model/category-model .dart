// ignore: camel_case_types
class category_model {
  String? title ,subtitle ,image , link;
  category_model({required title ,required subtitle ,required image , required link});
  category_model.fromjson({required Map<String,dynamic> data}){
    title = data['title'];
    subtitle = data['description'];
    image = data['urlToImage'];
    link = data['url'];
  }
}