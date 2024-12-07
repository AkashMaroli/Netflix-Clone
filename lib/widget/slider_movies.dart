 import 'package:flutter/material.dart';


class SliderMovies extends StatelessWidget {
  const SliderMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, inded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.amber,
                    height: 200,
                    width: 150,
                  ),
                ),
              );
            }));
  }
}
