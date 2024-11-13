import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/profile/presentation/pages/settings_detail_page.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class SettingsChangeCeoPage extends StatelessWidget {
  const SettingsChangeCeoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackWidget(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            CustomTextFieldWidget(title: "Имя", hintText: "Oleg "),
            SizedBox(height: 10),
            CustomTextFieldWidget(
                title: "Фамилия", hintText: "Belotserkovsky "),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;

  const CustomTextFieldWidget(
      {super.key, required this.hintText, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: AppColors.white, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: AppColors.episodeColor),
          cursorColor: AppColors.episodeColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.white),
            fillColor: AppColors.darkTextEditionColor,
            focusColor: AppColors.blueGreen,
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColors.episodeColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
