import 'package:flutter/material.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:netflixclonesecond/models/movie_model.dart';
import 'package:netflixclonesecond/screen/details_screen.dart';
import 'package:netflixclonesecond/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
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
          preferredSize: const Size(double.infinity, 100),
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
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                )),
            onChanged: (value) {
              searchForMovies(value);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              searchController.text.isEmpty
                  ? const Text(
                      'Top Search',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )
                  : const SizedBox(),
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
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailingScreen(
                                                  movieModel:
                                                      snapshot.data![index],
                                                )));
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            height: 120,
                                            width: 120,
                                          //  color: Colors.amber,
                                            // Changed fit to BoxFit.cover for better image scaling
                                            child: snapshot.data![index]
                                                        .backDropPath !=
                                                    null
                                                ? Image.network(
                                                    '${Constants.imageUrl}${snapshot.data![index].backDropPath}',
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    'assets/netflix_logo.jpg')),
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          snapshot.data![index].title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          overflow: TextOverflow.ellipsis,
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
                            return const SizedBox();
                          }
                        })
                    : searchController.text.isNotEmpty &&
                            searchFinalResult.isEmpty
                        ? const Center(child: Text('Not found'))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                            ),
                            itemCount: searchFinalResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailingScreen(
                                                movieModel:
                                                    searchFinalResult[index],
                                              )));
                                },
                                child: SizedBox(
                                  child: Column(
                                    // Changed to a standard Column without Expanded
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          child: Image.network(
                                            searchFinalResult[index]
                                                        .posterPath !=
                                                    null
                                                ? '${Constants.imageUrl}${searchFinalResult[index].posterPath}'
                                                : 'assets/netflix_logo.jpg',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/netflixpic.jpg',
                                                height: 157,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                            height: 157,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      // Added text style for consistency
                                      Text(
                                        searchFinalResult[index].title,
                                        style: const TextStyle(
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
