import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_movies/providers/movie_provider.dart';
import 'package:pop_movies/utils/api_constants.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  const DetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Detail"),
        backgroundColor: Colors.black,
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          DateTime? releaseDate = DateTime.tryParse(movieProvider.movies[index].releaseDate ?? "");
          return SafeArea(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                  width: double.infinity,
                  color: Colors.teal,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    movieProvider.movies[index].title ?? "",
                    style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            height: 200,
                            imageUrl: ApiConstants.IMAGE_BASE_URL + movieProvider.movies[index].posterPath!,
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                releaseDate?.year.toString() ?? "",
                                style: const TextStyle(color: Colors.black54, fontSize: 24, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "${movieProvider.movies[index].voteAverage}/10",
                                style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 120.w,
                                alignment: Alignment.center,
                                color: Colors.tealAccent,
                                child: Text(
                                  "MAKE AS FAVORITE",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        movieProvider.movies[index].overview ?? "",
                        style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Trailers:",
                        style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  size: 44,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(
                                  "Trailer 1",
                                  style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  size: 44,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(
                                  "Trailer 2",
                                  style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
