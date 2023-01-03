import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/data_model.dart';

class AppController extends GetxController {
  RxBool isLoading = false.obs;

  PageController pageController = PageController(initialPage: 0);

  RxList dataList = <DataModel>[].obs;
  RxList savedData = <DataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    Dio dio = Dio();

    try {
      isLoading(true);
      const url = 'https://opensea13.p.rapidapi.com/assets';
      var response = await dio.get(
        url,
        options: Options(
          headers: {
            'X-RapidAPI-Key': dotenv.env['API_KEY'],
            'X-RapidAPI-Host': dotenv.env['API_HOST']
          },
        ),
        queryParameters: {
          'collection_slug': 'bored-ape-bros',
          'order_direction': 'desc',
          'limit': '20',
          'include_orders': 'false'
        },
      );
      if (response.statusCode == 200) {
        List result = response.data['assets'];
        dataList.value = result.map((e) => DataModel.fromJson(e)).toList();
      } else {
        if (kDebugMode) {
          print('Status Code Error');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  void addDataToSaved(DataModel dataModel) {
    savedData.add(dataModel);
    log(savedData.last.name.toString());
    dataList.remove(dataModel);
  }

  goSaved() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  goDefault() {
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
