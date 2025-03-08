import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Trending Movies", color: Colors.white, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Descriptions(
                          name: trending[index]['title'],
                          description: trending[index]['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                          postUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                          vote: trending[index]['vote_average'].toString(),
                          launchOn: trending[index]['release_date']
                          )
                        )
                      );
                    },
                    child:
                    trending[index]['title'] != null ? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                )
                              )
                            ),
                            height: 200,
                          ),
                          Container(
                            child: ModifiedText(text: trending[index]['title'] != null ? trending[index]['title'] : 'Loading',
                            color: Colors.white,size: 12,),
                          )
                        ],
                      ),
                    ) : Container(),
                  );
                }),
          )
        ],
      ),

    );
  }
}
