import 'package:flutter/material.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:netflixclonesecond/models/movie_model.dart';
import 'package:netflixclonesecond/screen/details_screen.dart';
import 'package:netflixclonesecond/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<List<MovieModel>> topSearch;
  List<MovieModel> searchFinalResult = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topSearch = ApiServices().getTrendingMovies();
  }

  searchForMovies(String query) async {
    final result = await ApiServices().getSearchMovies(query);
    setState(() {
      searchFinalResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                )),
            onChanged: (value) {
              searchForMovies(value); // Rebuild UI on text change
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kept the original TextFormField with minor styling adjustments

              const SizedBox(
                height: 20,
              ),
              searchController.text.isEmpty
                  ? const Text(
                      'Top Search',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: searchController.text.isEmpty
                    ? FutureBuilder(
                        future: topSearch,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else if (snapshot.hasData) {
                            // final data = snapshot.data;
                            return ListView.separated(
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return GestureDetector(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DetailingScreen(movieModel: snapshot.data![index],)));
                    },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 120,
                                          width: 120,
                                          color: Colors.amber,
                                          // Changed fit to BoxFit.cover for better image scaling
                                          child: Image.network(
                                            '${Constants.imageUrl}${snapshot.data![index].posterPath}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        snapshot.data![index].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                    : searchController.text.isNotEmpty &&
                            searchFinalResult.isEmpty
                        ? Center(child: Text('Not found'))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                            ),
                            itemCount: searchFinalResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DetailingScreen(movieModel: searchFinalResult[index],)));
                    },
                                child: SizedBox(
                                  child: Column(
                                    // Changed to a standard Column without Expanded
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          child: Image.network(
                                            '${Constants.imageUrl}${searchFinalResult[index].posterPath}',
                                            // Changed fit to BoxFit.cover for better image scaling
                                            fit: BoxFit.cover,
                                            height: 157,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      // Added text style for consistency
                                      Text(
                                        searchFinalResult[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
