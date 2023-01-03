import 'package:bored_ape_bros_app/components/saved_list_widget.dart';
import 'package:bored_ape_bros_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/data_list_widget.dart';

class HomePage extends GetView<AppController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff383b50),
      appBar: AppBar(
        backgroundColor: const Color(0xff323448),
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Bored Ape Bros App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side:
                              const BorderSide(color: Colors.white30, width: 2),
                        ),
                        onPressed: () => controller.goDefault(),
                        child: Text(
                          'Collection (${controller.dataList.length})',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side:
                              const BorderSide(color: Colors.white30, width: 2),
                        ),
                        onPressed: () => controller.goSaved(),
                        child: Text(
                          'Saved (${controller.savedData.length})',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [
                  DataListWidget(),
                  SavedListWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
