import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:statico/misc/constants/Colors.dart';
import 'package:statico/screens/citizen/controllers/AddImageController.dart';


class AddImageView extends StatelessWidget {
  final controller = Get.put(AddImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image_title".tr),
        backgroundColor: BLUE,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: IconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () => controller.pickImage(ImageSource.camera))),
            Expanded(
                child: IconButton(
                    icon: Icon(Icons.photo_library),
                    onPressed: () => controller.pickImage(ImageSource.gallery))),
          ],
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Obx(
      ()=>ListView(
        children: [
          if (controller.isImageLoaded.value) ...[
            Image.file(controller.imageFile.value),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            FlatButton.icon(onPressed: ()=>controller.cropImage(), icon: Icon(Icons.crop), label: Text("edit_image".tr),
            )],
            ),
            controller.uploadTask == null
                ? FlatButton.icon(
              onPressed: ()=>controller.startUpload(),
              icon: Icon(Icons.cloud_upload),
              label: Text("upload_image".tr),
            )
                : Text("please_wait".tr)

          ]
        ],
      ),
    );
  }
}
