import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonesecond/models/movie_model.dart';
import 'package:netflixclonesecond/services/api_services.dart';
import 'package:netflixclonesecond/widget/carousel.dart';
import 'package:netflixclonesecond/widget/slider_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> trendingMovies;
  late Future<List<MovieModel>> topRatedMovies;
  late Future<List<MovieModel>> upcomingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = ApiServices().getTrendingMovies();
    topRatedMovies = ApiServices().getTopRatedMovies();
    upcomingMovies = ApiServices().getUpcomingMovies();
  }

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
              // const SlidingCarousel(), //!remove this line
              //!uncomment below lines
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        // final data = snapshot.data;
                        return SlidingCarousel(
                          snapshot: snapshot,
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
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
              //! second row of movies
              //const SliderMovies(),

              SizedBox(
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        // final data = snapshot.data;
                        return SliderMovies(
                          snapshot: snapshot,
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
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
              //! 3rd row of movies
              // const SliderMovies(),
              
              SizedBox(
                child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        // final data = snapshot.data;
                        return SliderMovies(
                          snapshot: snapshot,
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
