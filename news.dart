import 'dart:convert';

import 'package:http/http.dart' as http;

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ArticleModel({required this.author, required this.title,
    required this.description,required this.url,
    required this.urlToImage, required this.content});
}

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=31199b72f238424ba57c46e7aae0a696";

    var response = await http.get(Uri.parse(url));

    dynamic jsonData = jsonDecode(response.body);

    print(jsonData.toString());

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        });
    }

  }
}
