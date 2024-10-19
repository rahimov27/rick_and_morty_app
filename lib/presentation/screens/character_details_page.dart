import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  width: double.infinity,
                  height: 218,
                  fit: BoxFit.cover,
                  "https://m.media-amazon.com/images/M/MV5BZGQyZjk2MzMtMTcyNC00NGU3LTlmNjItNDExMWM4ZDFhYmQ2XkEyXkFqcGc@._V1_.jpg"),
              Container(
                width: double.infinity,
                height: 218,
                color:
                    const Color.fromARGB(255, 102, 102, 102).withOpacity(0.40),
              ),
            ],
          )
        ],
      ),
    );
  }
}
