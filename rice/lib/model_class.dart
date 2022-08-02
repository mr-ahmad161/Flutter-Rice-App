import 'package:image_picker/image_picker.dart';

class User {
  final String name;
  final String phone;
  final String location;
  final String numofbag;
  final String wigofbag;
  final String price;
  final List<XFile> file;
  const User(this.name, this.phone, this.location, this.numofbag, this.wigofbag,
      this.price, this.file);
}
