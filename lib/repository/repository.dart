import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Repository {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();

    return File("${directory.path}/data.json");
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;

      return await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
      return '';
    }
  }

  Future<File> saveData(String tasksEncoded) async {
    final file = await _localFile;

    return file.writeAsString(tasksEncoded);
  }
}
