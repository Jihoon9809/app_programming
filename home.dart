import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'news.dart';

const apikey = '576d46ee1760bd0dbff8bdb769d6e2dc';
const city = 'Busan';
//const url = "http://naver.com";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
with SingleTickerProviderStateMixin {
  List<ArticleModel>? articles = new List<ArticleModel>.empty(growable: true);
  double? temp;

  Future getWeather() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apikey}";
    var response = await http.get(Uri.parse(url));
    dynamic jsonData = jsonDecode(response.body);
    setState(() {
      temp = jsonData['main']['temp'];

    });
    //print(jsonData.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
    _tabController = TabController(length: _tabList.length, vsync: this);
    //getWeather();
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
    });
  }

  List<Tab> _tabList = [
    Tab(child: Text("Top"),),
    Tab(child: Text("Popular"),),
    Tab(child: Text("Trending"),),
    Tab(child: Text("Editor Choice"),),
    Tab(child: Text("Top"),),
  ];

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final home_logo = Text( //어플 로고이미지로 변경
      "News App",
      style: TextStyle(
          color: Colors.black),
    );
    final Leading_button = IconButton(
      onPressed: () {
      showSearch(
          context: context, delegate: MysearchDelegate(),);
    }, icon: Icon(Icons.search), color: Colors.grey,);

    final Info_button = IconButton(onPressed: () {
      getWeather();
    }, icon: Icon(Icons.info), color: Colors.grey,);

    final current_location = Text(
      temp != null ? temp.toString() +"\u00B0" : " ",
      style: TextStyle( // 위도 및 경로를 활용하여 현위치 이름으로 변경.
          height: 2.2,
          fontSize: 0,
          color: Colors.black),
    );

    final main_article = Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: articles!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 450,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      launch("${articles![index].url}");
                    },
                    child:
                    Container(
                      height: 200,
                      width: 600,
                      child: articles!.length == 0 ? Text('연결 x') : Image
                          .network(
                          "${articles![index].urlToImage}", fit: BoxFit.fill),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      launch("${articles![index].url}");
                    },
                    child:
                    Container(
                      child: Column(
                        children: [
                          articles!.length == 0 ? Text('연결 x') : Text(
                              "${articles![index].title} \n",
                              style: TextStyle(fontSize: 18
                                  ,fontWeight: FontWeight.bold)),
                          articles!.length == 0 ? Text('연결 x') : Text(
                              "${articles![index].description}",
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),)
                ],
              )
            //
          );
        },
        separatorBuilder: (BuildContext context,
            int index) => const Divider(),
      ),
    );
    //final List<String> entries = <String>['A', 'B', 'C'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: home_logo,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
        centerTitle: true,
        leading: Leading_button,
        actions: [
          Container(
            child: Column(
              children: [
                Text("$temp",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("$city",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ],
            ),
          ),
          Info_button,
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
            child: main_article,
          ) ,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class MysearchDelegate extends SearchDelegate{
  List<String> searchResults =[
    'Korea','USA','England','Japan','China'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      onPressed: () {
        if(query.isEmpty){
          close(context, null);
        }else{
          query ='';
        }
      }, icon: Icon(Icons.clear), color: Colors.grey,);
  }

  @override
  Widget buildLeading(BuildContext context) =>
      IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () => close(context, null));


  @override
  Widget buildResults(BuildContext context) => Center(
    child:  Text(
      query
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult){
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions. length,
        itemBuilder: (context, index){
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: (){
              query = suggestion;

              showResults(context);
            },
          );
        }
    );
  }
}

