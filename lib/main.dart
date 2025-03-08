import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/widgets/topRated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final apiKey = '8485542d152e76374af7f2c9e3f03094';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NDg1NTQyZDE1MmU3NjM3NGFmN2YyYzllM2YwMzA5NCIsIm5iZiI6MTc0MTQ2MDMxMS42MDQsInN1YiI6IjY3Y2M5MzU3ZTk0NjFhZGY0MTRmOTc0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tPi3n2WrnFP8n03hswKYP3o4Mt9hppinN3lo2xNzuK0';

  @override
  void initState(){
    super.initState();
    loadMovies();
  }

  loadMovies() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true
        )
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    print(trendingResult);

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topratedResult['results'];
      tv = tvResult['results'];

      
      print(trendingMovies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: ModifiedText(text: "Movie App ❤️",color: Colors.white,size: 18,),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(topRated: topRatedMovies),
          TrendingMovies(trending: trendingMovies)
        ],
      ),
    );
  }
}

