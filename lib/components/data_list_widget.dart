import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import 'empty_widget.dart';
import 'loading_widget.dart';

class DataListWidget extends GetView<AppController> {
  const DataListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingWidget(
        isLoading: controller.isLoading.value,
        child: EmptyWidget(
          dataLenght: controller.dataList.length,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 5);
            },
            physics: const BouncingScrollPhysics(),
            itemCount: controller.dataList.length,
            itemBuilder: (context, index) {
              final result = controller.dataList[index];
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
                  trailing: IconButton(
                    onPressed: () {
                      controller.addDataToSaved(result);
                    },
                    icon: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.white30,
                      size: 32,
                    ),
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
