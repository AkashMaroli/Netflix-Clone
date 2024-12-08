import 'package:flutter/material.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:netflixclonesecond/screen/details_screen.dart';
import 'package:netflixclonesecond/services/api_services.dart';

class SliderMovies extends StatelessWidget {
  const SliderMovies({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DetailingScreen(movieModel: snapshot.data[index],)));
                    },
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          "${Constants.imageUrl}${snapshot.data[index].posterPath}"),
                    ),
                  ),
                ),
              );
            }));
  }
}
