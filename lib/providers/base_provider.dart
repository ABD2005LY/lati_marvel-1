import 'package:flutter/foundation.dart';
import 'package:lati_marvel/services/api.dart';

class BaseProvider with ChangeNotifier {
  Api api = Api();
  bool busy = false;

  setBusy(bool value) {
    busy = value;
    notifyListeners();
  }
}
