import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'AddCaseController.dart';



class AddImageController extends GetxController{

  static AddImageController to = Get.find();

  final AddCaseController caseController = AddCaseController.to;

  final picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;

  var imageFile = File("").obs;
  String? url;

  UploadTask? uploadTask;
  var isImageLoaded = false.obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        isImageLoaded.value = true;
      print("Replaced");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage() async {

    File cropped = (await ImageCropper.cropImage(sourcePath: imageFile.value.path))!;
    imageFile.value = cropped;

  }

  Future<void> startUpload() async {

    String filePath = 'images/${DateTime.now()}.png';
    Reference ref = storage.ref().child(filePath);
      uploadTask = ref.putFile(imageFile.value);
    await uploadTask!.then((res) {
      res.ref.getDownloadURL().then((value) {
        print("file is uploaded url: $value");
        url = value;
        caseController.images.replaceRange(caseController.currentIndex.value, caseController.currentIndex.value + 1, [imageFile.value]);
        caseController.urls.add(url);
        Get.back();
      });
    });
  }

}