import 'package:get_storage/get_storage.dart';

class SaveValue{
   final box = GetStorage();

  String getValue(String key) {
    return box.read(key) ?? '';
  }

  void setValue(String key, String value) {
    box.write(key, value);
  }
}