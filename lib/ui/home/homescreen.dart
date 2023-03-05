import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/bloc/bloc/movie_bloc.dart';
import 'package:tmdb_app/ui/components/bottom_bar_widget.dart';
import 'package:tmdb_app/ui/home/dashboard_page.dart';
import 'package:tmdb_app/ui/home/media_library.dart';
import 'package:tmdb_app/ui/home/more_page.dart';
import 'package:tmdb_app/ui/home/movie_list_page.dart';
import 'package:tmdb_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc movieBloc;

  int selectedIndex = 1;
  PageController pageController = PageController(initialPage: 1);

  @override
  void initState() {
    movieBloc = BlocProvider.of<MovieBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFefefef),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: BottomAppBar(
          color: AppColors.bottomBarColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: getBottomBarWidget(
                    index: 0,
                    svgImage: 'assets/images/dashboard_icon.svg',
                    tabText: 'Dashboard',
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                      pageController.jumpToPage(0);
                    },
                  ),
                ),
                Flexible(
                  child: getBottomBarWidget(
                    index: 1,
                    svgImage: 'assets/images/watch_icon.svg',
                    tabText: 'Watch',
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                      pageController.jumpToPage(1);
                    },
                  ),
                ),
                Flexible(
                  child: getBottomBarWidget(
                    index: 2,
                    svgImage: 'assets/images/media_icon.svg',
                    tabText: 'Media Library',
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                      pageController.jumpToPage(2);
                    },
                  ),
                ),
                Flexible(
                  child: getBottomBarWidget(
                    index: 3,
                    svgImage: 'assets/images/more_icon.svg',
                    tabText: 'More',
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                      pageController.jumpToPage(3);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          selectedIndex = index;
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardPage(),
          MovieListPage(),
          MediaLibraryPage(),
          MorePage(),
        ],
      ),
    );
  }
}
