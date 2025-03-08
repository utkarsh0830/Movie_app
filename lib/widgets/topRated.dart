import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Top Rated Movies", color: Colors.white, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Descriptions(
                          name: topRated[index]['title'],
                          description: topRated[index]['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'],
                          postUrl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
                          vote: topRated[index]['vote_average'].toString(),
                          launchOn: topRated[index]['release_date']
                          )
                        )
                      );
                    },
                    child:
                    topRated[index]['title'] != null ? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path']
                                    )
                                )
                            ),
                            height: 200,
                          ),
                          Container(
                            child: ModifiedText(text: topRated[index]['title'] != null ? topRated[index]['title'] : 'Loading',
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
