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
            Column(
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
                const SizedBox(height: 100), // для пространства под аватаром
                Text(
                  data.name ?? 'Character Name',
                  style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
              ],
            ),
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
