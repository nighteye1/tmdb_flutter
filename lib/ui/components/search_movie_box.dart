import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/model/upcoming_movie_model.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';
import 'package:tmdb_app/utils/app_colors.dart';

class SearchMovieBox extends StatelessWidget {
  final UpcomingMovieModel upcomingMovieModel;
  final void Function()? onTap;
  const SearchMovieBox({
    super.key,
    required this.upcomingMovieModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: upcomingMovieModel.backdropPath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 21,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    upcomingMovieModel.title,
                    style: poppinsStyle(
                      fSize: 16.sp,
                      fWeight: FontWeight.w500,
                      fColor: const Color(0xFF202c43),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.adaptive.more_rounded,
              color: AppColors.skyBlue,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
