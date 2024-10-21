import 'dart:ui'; // Для использования ImageFilter

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    super.key,
    required this.data,
  });

  final MyCharacters data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 300,
                          "${data.image}",
                        ),
                        Container(
                          height: 300,
                          color: Colors.black
                              .withOpacity(0.2), // затемнение изображения
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 100), // для пространства под аватаром
                    Column(
                      children: [
                        Text(
                          data.name ?? 'Character Name',
                          style: const TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white),
                        ),
                        Text(
                          data.status?.toUpperCase() ?? 'Character Status',
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.green),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудностьи социопатия заставляют беспокоиться семью его дочери.",
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Пол",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                            Text(
                              data.gender ?? 'Character Gender',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Расса",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                            Text(
                              data.species ?? 'Character Species',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Место рождения",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                            Text(
                              data.origin?.name ?? 'Character Origin',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.white,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Место рождения",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                            Text(
                              data.location?.name ?? 'Character Location',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.white,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: 1,
                        color: AppColors.darkTextEditionColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Fixed CircleAvatar
            Positioned(
              top: 210, // корректное позиционирование аватара
              left: MediaQuery.of(context).size.width / 2 - 80,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.darkBgColor,
                child: CircleAvatar(
                  radius: 73,
                  backgroundImage: NetworkImage(data.image ?? ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
