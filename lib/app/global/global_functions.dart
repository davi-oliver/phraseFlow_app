import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:path_provider/path_provider.dart';

class VerificaInternet {
  Future<bool> result(context) async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      return true;
    }
    return false;
  }
}

class LocalPath {
  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // ARMAZENAR OS DADOS LOCALMENTE lessons
  Future<File> get lessons async {
    final path = await _localPath;
    return File('$path/lessons.text');
  }

  // armazenar lessons by user
  Future<File> get lessonsByUser async {
    final path = await _localPath;
    return File('$path/lessonsByUser.text');
  }

  // armazenar users
  Future<File> get users async {
    final path = await _localPath;
    return File('$path/users.text');
  }

  // armazenar lessons completed
  Future<File> get lessonsCompleted async {
    final path = await _localPath;
    return File('$path/lessonsCompleted.text');
  }
}
