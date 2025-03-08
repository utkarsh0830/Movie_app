import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';

class Descriptions extends StatelessWidget {

 final String name, description,bannerUrl,postUrl,vote,launchOn;

  const Descriptions({super.key, required this.name, required this.description, required this.bannerUrl, required this.postUrl, required this.vote, required this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerUrl,fit: BoxFit.cover,),
                  )),
                  Positioned(
                    bottom: 10,
                      child: ModifiedText(text: "⭐ Average Rating - " + vote,color: Colors.white,size: 18,))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                text: name != null ? name : 'Not loaded',size: 24,color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: "Releasing On - " + launchOn,color: Colors.white,size: 14,),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(postUrl),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
