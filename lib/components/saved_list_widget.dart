import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import 'empty_widget.dart';
import 'loading_widget.dart';

class SavedListWidget extends GetView<AppController> {
  const SavedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingWidget(
        isLoading: controller.isLoading.value,
        child: EmptyWidget(
          dataLenght: controller.savedData.length,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 5);
            },
            physics: const BouncingScrollPhysics(),
            itemCount: controller.savedData.length,
            itemBuilder: (context, index) {
              final result = controller.savedData[index];
              return Card(
                color: const Color(0xff323448),
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(result.imageUrl!),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    result.name!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    result.description ?? 'No Description',
                    style: const TextStyle(color: Colors.white54),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                    size: 32,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
