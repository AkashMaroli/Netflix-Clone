import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kept the original TextFormField with minor styling adjustments
              TextFormField(
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
                  ),focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(20),)
                ),
                onChanged: (value) {
                  setState(() {}); // Rebuild UI on text change
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Top Search',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: searchController.text.isEmpty
                    ? ListView.separated(
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  color: Colors.amber,
                                  // Changed fit to BoxFit.cover for better image scaling
                                  child: Image.asset(
                                    'assets/netflixpic.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Movie title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: 19,
                        itemBuilder: (context, index) {
                          return Container(
                            // Removed height and width constraints
                            // Removed Expanded widget which was causing the error
                            color: Colors.transparent,
                            child: Column(
                              // Changed to a standard Column without Expanded
                              children: [
                                ClipRRect( borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/netflixpic.jpg',
                                    // Changed fit to BoxFit.cover for better image scaling
                                    fit: BoxFit.cover,
                                    height: 157,
                                    width: double.infinity,
                                  ),
                                ),
                                // Added text style for consistency
                                const Text(
                                  'Movie title',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
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