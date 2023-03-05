import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';

import '../../model/movie_detail_model.dart';
import '../../utils/app_colors.dart';

class GenreList extends StatelessWidget {
  final List<Genres> genres;
  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemBuilder: (ctx, index) {
        return Container(
          decoration: BoxDecoration(
            color: index == 0
                ? AppColors.seaGreen
                : index == 1
                    ? AppColors.pinkColor
                    : index % 2 == 0
                        ? AppColors.purpleColor
                        : AppColors.mustardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.only(right: 5.w),
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: FittedBox(
            child: Text(
              genres[index].name,
              style: poppinsStyle(
                fSize: 12.sp,
                fColor: Colors.white,
                fWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
