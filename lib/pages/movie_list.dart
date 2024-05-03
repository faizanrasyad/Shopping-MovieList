import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_request/http_service/get_popular.dart';
import 'package:http_request/models/movieModel.dart';
import 'package:http_request/pages/movie_detail.dart';
import 'package:http_request/widgets/bottom_navigasi.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MovieList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  GetPopular getter = GetPopular();

  Future<void> initialize() async {
    movies = await getter.getPopular();
    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  void initState() {
    super.initState();
    getter = GetPopular();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 42,
                  color: Colors.black,
                ),
                Text(
                  "Hot Movies",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w800)),
                ),
                Icon(
                  Icons.person,
                  size: 42,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: moviesCount,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MovieDetail(movies[index])));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original${movies[index].poster}",
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Text(
                                        movies[index].title,
                                        overflow: TextOverflow.clip,
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.yellow,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Text(
                                            "${movies[index].voteAverage.round().toString()}/10 IMDb",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.black26)),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          size: 14,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "1h 52m",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 12)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            ),
          ))
        ],
      )),
      bottomNavigationBar: BottomNav(selectedItem: 1),
    );
  }
}
