import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_movies/screens/home_screen.dart';

class PopMovies extends StatelessWidget {
  const PopMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 830),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pop Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
