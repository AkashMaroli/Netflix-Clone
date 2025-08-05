import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:netflixclonesecond/models/movie_model.dart';
import 'package:netflixclonesecond/services/api_services.dart';
import 'package:netflixclonesecond/widget/movie_grid_widget.dart';

class DetailingScreen extends StatefulWidget {
  const DetailingScreen({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  State<DetailingScreen> createState() => _DetailingScreenState();
}

class _DetailingScreenState extends State<DetailingScreen> {
  late Future<List<MovieModel>> movieTopRataed;
  @override
  void initState() {
    super.initState();
    movieTopRataed = ApiServices().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: ScrollBehavior(),
        slivers: [
          SliverAppBar.large(
            leading: Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(top: 8, left: 8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )),
            ),
            backgroundColor: Constants.backgrordColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.movieModel.posterPath != null
                      ? "${Constants.imageUrl}${widget.movieModel.posterPath}"
                      : 'assets\netflixpic.jpg',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        'assets/netflix_logo.jpg'); // Local fallback
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.openSans(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.movieModel.overview,
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              'Release date: ',
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.movieModel.releaseData,
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'More like this',
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              // height: 500,
              child: FutureBuilder(
                  future: movieTopRataed,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return GridMovies(
                        snapshot: snapshot,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
