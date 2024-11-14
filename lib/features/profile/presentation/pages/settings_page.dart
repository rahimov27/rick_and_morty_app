import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/features/profile/presentation/pages/settings_detail_page.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/about_app_text_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/edit_button_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/profile_app_bar_title_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/profile_avatar_row_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/profile_sub_title_widget.dart';
import 'package:rick_and_morty_app/shared/resources/resources.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String profileUrl =
        'https://static.wikia.nocookie.net/rickandmorty/images/a/a1/WeirdRickNew.png/revision/latest?cb=20231116001035';

    const String aboutText =
        "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.";
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const ProfileAppBarTitleWidget(
          text: "Настройки",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 33),
              const ProfileAvatarRowWidget(profileUrl: profileUrl),
              const SizedBox(height: 30),
              EditButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsDetailPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              const Divider(
                color: AppColors.darkTextEditionColor,
                thickness: 1.0,
              ),
              const SizedBox(height: 36),
              const ProfileSubTitleWidget(
                text: "Внешний вид",
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  SvgPicture.asset(Svgs.theme),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Темная тема",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      ),
                      Text(
                        "Включена",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Divider(
                color: AppColors.darkTextEditionColor,
                thickness: 1.0,
              ),
              const SizedBox(height: 36),
              const ProfileSubTitleWidget(
                text: "О приложении",
              ),
              const SizedBox(height: 24),
              const AboutAppTextWidget(aboutText: aboutText),
              const SizedBox(height: 36),
              const Divider(
                color: AppColors.darkTextEditionColor,
                thickness: 1.0,
              ),
              const SizedBox(height: 24),
              const ProfileSubTitleWidget(
                text: "Версия приложения",
              ),
              const SizedBox(height: 24),
              const AboutAppTextWidget(aboutText: "Rick & Morty  v1.0.0"),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
