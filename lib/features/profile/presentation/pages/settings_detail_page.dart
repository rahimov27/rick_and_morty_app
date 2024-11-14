import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/profile/presentation/pages/settings_change_ceo_page.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/change_ceo_row_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/profile_app_bar_title_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/profile_sub_title_widget.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class SettingsDetailPage extends StatelessWidget {
  const SettingsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String profileUrl =
        'https://static.wikia.nocookie.net/rickandmorty/images/a/a1/WeirdRickNew.png/revision/latest?cb=20231116001035';
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        centerTitle: false,
        title: const ProfileAppBarTitleWidget(
          text: "Редактировать профиль",
        ),
        leading: const AppBackWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 41),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(profileUrl),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Изменить фото",
                      style: TextStyle(
                          color: AppColors.episodeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const ProfileSubTitleWidget(
              text: "профиль",
            ),
            const SizedBox(height: 24),
            ChangeCeoRowWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsChangeCeoPage()));
                },
                title: "Изменить ФИО",
                subtitle: "Oleg Belotserkovsky"),
            const SizedBox(height: 20),
            ChangeCeoRowWidget(
              title: "Логин",
              subtitle: "Rick",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AppBackWidget extends StatelessWidget {
  const AppBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.white,
        size: 20,
      ),
    );
  }
}
