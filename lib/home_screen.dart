import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/pages/characters_page.dart';
import 'package:rick_and_morty_app/features/episode/presentation/pages/episode_page.dart';
import 'package:rick_and_morty_app/features/location/presentation/pages/locations_page.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';
import 'package:rick_and_morty_app/shared/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const CharactersPage(),
    const LocationsPage(),
    const EpisodePage(),
    const Scaffold(
      body: Text("4"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.green,
          selectedLabelStyle: const TextStyle(
            color: AppColors.green, // Selected label color
          ),
          unselectedLabelStyle: const TextStyle(
            color: AppColors.grey, // Unselected label color
          ),
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          backgroundColor: AppColors.darkBgColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex, // Use currentIndex to track selection
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Svgs.actions,
                  colorFilter: ColorFilter.mode(
                      currentIndex == 0 ? AppColors.green : AppColors.grey,
                      BlendMode.srcIn)),
              label: "Персонажи",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Svgs.location,
                  colorFilter: ColorFilter.mode(
                      currentIndex == 1 ? AppColors.green : AppColors.grey,
                      BlendMode.srcIn)),
              label: "Локация",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Svgs.episode,
                  colorFilter: ColorFilter.mode(
                      currentIndex == 2 ? AppColors.green : AppColors.grey,
                      BlendMode.srcIn)),
              label: "Эпизоды",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Svgs.settings,
                  colorFilter: ColorFilter.mode(
                      currentIndex == 3 ? AppColors.green : AppColors.grey,
                      BlendMode.srcIn)),
              label: "Настройки",
            ),
          ]),
    );
  }
}
