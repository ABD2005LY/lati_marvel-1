import 'package:flutter/foundation.dart';
import 'package:lati_marvel/services/api.dart';

class BaseProvider with ChangeNotifier {
    Api api = Api();
    bool busy=false;
      bool fold = true;
  setBusy(bool value){
busy = value;
notifyListeners();
  }
  setFailed(bool value) {
    fold = value;
    notifyListeners();
  }


}