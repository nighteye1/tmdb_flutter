import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/model/upcoming_movie_model.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';
import 'package:tmdb_app/ui/components/search_movie_box.dart';

import '../movie/movie_detail.dart';

class ResultsPage extends StatelessWidget {
  final List<UpcomingMovieModel> results;
  final void Function()? onBackTap;
  const ResultsPage({
    super.key,
    required this.results,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                right: 22.w,
                left: 22.w,
                bottom: 24.h,
                top: 24.h,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onBackTap,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 26.w,
                  ),
                  Text(
                    '${results.length} Results Found',
                    style: poppinsStyle(
                      fSize: 16.sp,
                      fWeight: FontWeight.w500,
                      fColor: const Color(0xFF202c43),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            padding: EdgeInsets.symmetric(vertical: 30.h),
            itemBuilder: (ctx, index) {
              return SearchMovieBox(
                upcomingMovieModel: results[index],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        upcomingMovieModel: results[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
