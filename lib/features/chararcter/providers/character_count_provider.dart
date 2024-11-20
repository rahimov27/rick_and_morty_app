import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharacterCountProvider extends ChangeNotifier {
  final Dio dio;

  CharacterCountProvider(this.dio);

  String? countData;

  Future<void> getCountCharacter() async {
    try {
      final response =
          await dio.get("https://rickandmortyapi.com/api/character");
      if (response.statusCode == 200) {
        countData = response.data['info']['count'].toString();
        notifyListeners(); // Уведомляем слушателей об изменениях
      }
    } catch (e) {
      print("Error fetching count data: $e");
    }
  }
}
