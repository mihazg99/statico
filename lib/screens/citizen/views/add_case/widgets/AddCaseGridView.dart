import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/screens/citizen/controllers/AddCaseController.dart';
import 'package:statico/screens/citizen/views/add_image/AddImageView.dart';


class AddCaseGridView extends StatelessWidget {
  final controller = AddCaseController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: List.generate(controller.images.length, (index) {
          if (controller.images[index] is String) {

            return Card(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Get.to(()=>AddImageView());
                  controller.currentIndex.value = index;
                },
              ),
            );
          } else {
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: <Widget>[
                  Image.file(
                    controller.images[index],
                    width: 300,
                    height: 300,
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: InkWell(
                      child: Icon(
                        Icons.remove_circle,
                        size: 20,
                        color: Colors.red,
                      ),
                      onTap: () {
                        controller.images[index] = 'Add image';
                        controller.currentIndex.value = index;
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
