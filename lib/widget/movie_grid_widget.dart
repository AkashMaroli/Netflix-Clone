import 'package:flutter/material.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:netflixclonesecond/screen/details_screen.dart';

class GridMovies extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const GridMovies({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: snapshot.data!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4, mainAxisSpacing: 4, crossAxisCount: 3),
        itemBuilder: (context, itemIndex) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 200,
               
                child: GestureDetector(
                   onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DetailingScreen(movieModel: snapshot.data[itemIndex],)));
                    },
                  child: Image.network(
                     filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    "${Constants.imageUrl}${snapshot.data![itemIndex].posterPath}",
                   
                  ),
                ),
              ),
            ),
          );
        });
  }
}
