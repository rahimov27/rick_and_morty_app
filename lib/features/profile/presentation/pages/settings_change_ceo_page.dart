import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/profile/presentation/pages/settings_detail_page.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/edit_button_widget.dart';
import 'package:rick_and_morty_app/features/profile/presentation/widgets/profile_app_bar_title_widget.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsChangeCeoPage extends StatefulWidget {
  const SettingsChangeCeoPage({super.key});

  @override
  State<SettingsChangeCeoPage> createState() => _SettingsChangeCeoPageState();
}

class _SettingsChangeCeoPageState extends State<SettingsChangeCeoPage> {
  late SharedPreferences prefs;
  String? name;
  String? surname;
  String? fatherName;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    name = prefs.getString("name") ?? "";
    surname = prefs.getString("surname") ?? "";
    fatherName = prefs.getString("fatherName") ?? "";

    nameController.text = name!;
    surnameController.text = surname!;
    fatherNameController.text = fatherName!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        leading: const AppBackWidget(),
        title: const ProfileAppBarTitleWidget(
          text: "Изменить ФИО",
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            CustomTextFieldWidget(
              title: "Имя",
              hintText: "$name",
              controller: nameController,
            ),
            const SizedBox(height: 10),
            CustomTextFieldWidget(
              title: "Фамилия",
              hintText: "$surname",
              controller: surnameController,
            ),
            const SizedBox(height: 10),
            CustomTextFieldWidget(
              title: "Отчество",
              hintText: "$fatherName",
              controller: fatherNameController,
            ),
            const Spacer(),
            EditButtonWidget(
              bgColor: AppColors.episodeColor,
              textColor: AppColors.white,
              buttonText: "Сохранить",
              onPressed: () {
                name = nameController.text;
                surname = surnameController.text;
                fatherName = fatherNameController.text;

                prefs.setString("name", nameController.text);
                prefs.setString("surname", surnameController.text);
                prefs.setString("fatherName", fatherNameController.text);

                name = prefs.getString("name");
                surname = prefs.getString("surname");
                fatherName = prefs.getString("fatherName");
                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Вы успешно сохранили данные"),
                  ),
                );
              },
            ),
            const SizedBox(height: 33),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.title,
      this.controller});

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
          controller: controller,
          style: const TextStyle(color: AppColors.white),
          cursorColor: AppColors.episodeColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.grey),
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
