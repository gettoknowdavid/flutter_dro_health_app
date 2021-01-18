import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PharmacyDatabase {
  static Future initialize() async {
    await _initSembast();
  }

  static Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final path = join(appDir.path, 'sembast_.db');
    final db = await databaseFactoryIo.openDatabase(path);
    GetIt.I.registerSingleton<Database>(db);
    // await databaseFactoryIo.openDatabase(path);

  }
}
