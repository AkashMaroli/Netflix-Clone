import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonesecond/widget/carousel.dart';
import 'package:netflixclonesecond/widget/slider_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/netflix_logo.png",
            fit: BoxFit.contain,
            height: 50,
            width: 130,
          ),
        ),
        actions: [
          const InkWell(
              child: Icon(
            Icons.search,
            color: Colors.white,
          )),
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 27,
              width: 27,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const SlidingCarousel(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Top rated movies",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              const SliderMovies(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Upcoming movies",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              const SliderMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
