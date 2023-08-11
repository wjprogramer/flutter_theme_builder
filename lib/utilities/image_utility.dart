import 'package:image_picker/image_picker.dart';

class ImageUtility {
  ImageUtility._();

  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    return file;

    // final LostDataResponse response = await picker.retrieveLostData();
    // if (response.isEmpty) {
    //   return;
    // }
    // final List<XFile>? files = response.files;
  }

}