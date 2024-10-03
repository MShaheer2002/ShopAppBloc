import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:udemy_bloc_app/common/services/storage_service/storage.dart';

class Global {
  static late StorageService _storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    _storageService = await StorageService().init();
  }
}
