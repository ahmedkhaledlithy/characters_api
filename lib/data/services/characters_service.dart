import 'package:characters_api/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharactersService {
  late Dio dio;

  CharactersService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000, //5s
      receiveTimeout: 3000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchAllCharacters() async {
    try {
      Response response = await dio.get("characters");

      if (response.statusCode==200){
        return response.data;
      }else{
        debugPrint(response.statusCode.toString());
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> fetchCharacterQuotes(String charName) async {
    try {
      Response response = await dio.get("quote",queryParameters: {
        "author": charName
      });

      if (response.statusCode==200){
        return response.data;
      }else{
        debugPrint(response.statusCode.toString());
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
