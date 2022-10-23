import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_movies/providers/movie_provider.dart';
import 'package:pop_movies/screens/details_screen.dart';
import 'package:pop_movies/utils/api_constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late MovieProvider _movieProvider;
  int page = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Loading list of Photos
      Provider.of<MovieProvider>(context, listen: false).fetchMovies();
    });
    _scrollController.addListener(() {
      print("${_scrollController.position.maxScrollExtent / 2} =========== ${_scrollController.offset}");

      if (_scrollController.position.maxScrollExtent / 2 <= _scrollController.offset) {
        if (_movieProvider.movies.length <= _movieProvider.pageCount) {
          _movieProvider.fetchMovies(page: page);
        }
        page = page + 1;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieProvider = Provider.of<MovieProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pop Movies"),
        backgroundColor: Colors.black,
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          return SafeArea(
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: (MediaQuery.of(context).size.width - 98).w,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
              ),
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(index: index)),
                    );
                  },
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(), // you can add pre loader iamge as well to show loading.
                    ),
                    imageUrl: ApiConstants.IMAGE_BASE_URL + movieProvider.movies[index].posterPath!,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
