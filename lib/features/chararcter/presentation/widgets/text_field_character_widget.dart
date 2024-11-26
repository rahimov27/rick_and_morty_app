import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/shared/resources/resources.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class TextFieldCharacterWidget extends StatelessWidget {
  const TextFieldCharacterWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // Если значение не пустое, вызываем событие поиска
        if (value.isNotEmpty) {
          BlocProvider.of<CharacterBloc>(context).add(
            SearchCharacterByNameEvent(name: value), // Добавлено событие поиска
          );
        } else {
          BlocProvider.of<CharacterBloc>(context).add(
              LoadCharactersEvent()); // Если строка пустая, загружаем всех персонажей
        }
      },
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColors.darkTextEditionColor,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                Svgs.filter,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            Svgs.search,
            color: AppColors.grey,
          ),
        ),
        hintText: "Найти персонажа",
        hintStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.darkTextEditionColor,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.darkTextEditionColor,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
