import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';

class MediaLibraryPage extends StatelessWidget {
  const MediaLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming Soon',
        style: poppinsStyle(
          fSize: 18.sp,
          fColor: Colors.black,
          fWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
