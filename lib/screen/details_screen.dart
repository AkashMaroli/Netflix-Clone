import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:netflixclonesecond/models/movie_model.dart';

class DetailingScreen extends StatelessWidget {
  const DetailingScreen({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              // title: Text(
              //   movieModel.title,
              //   style: GoogleFonts.belleza(
              //       fontSize: 17, fontWeight: FontWeight.bold),
              // ),
              background: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "${Constants.imageUrl}${movieModel.posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
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
                    movieModel.overview,
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
                              movieModel.releaseData,
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
