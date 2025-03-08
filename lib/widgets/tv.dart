import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "TV Shows", color: Colors.white, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Descriptions(
                            name: tv[index]['original_name'] ?? 'No Name Available',
                            description: tv[index]['overview'] ?? 'No Description Available',
                            bannerUrl: tv[index]['backdrop_path'] != null
                                ? 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path']
                                : 'https://via.placeholder.com/500x281.png?text=No+Image',
                            postUrl: tv[index]['poster_path'] != null
                                ? 'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path']
                                : 'https://via.placeholder.com/500x750.png?text=No+Image',
                            vote: tv[index]['vote_average'] != null
                                ? tv[index]['vote_average'].toString()
                                : 'N/A',
                            launchOn: tv[index]['release_date'] ?? 'Unknown',
                          ),
                        ),
                      );

                    },
                    child:
                    tv[index]['original_name'] != null ? Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      tv[index]['backdrop_path'] != null
                                          ? 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path']
                                          : 'https://via.placeholder.com/500x281.png?text=No+Image',
                                    ),
                                  fit: BoxFit.cover
                                ),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            width: 250,
                            height: 140,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: ModifiedText(text: tv[index]['original_name'] != null ? tv[index]['original_name'] : 'Loading',
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
