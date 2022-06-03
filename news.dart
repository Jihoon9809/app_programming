import 'dart:convert';

import 'package:http/http.dart' as http;

class ArticleModel {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String content;

  ArticleModel({required this.author, required this.title,
    required this.description,required this.url,
    required this.urlToImage, required this.content});
}

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=31199b72f238424ba57c46e7aae0a696";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    print(jsonData.toString());
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }

      });
    }

  }
}
