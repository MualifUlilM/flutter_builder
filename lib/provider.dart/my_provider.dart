import 'package:flutter/foundation.dart';
import 'package:my_app/model/my_model.dart';

class MyProvider extends ChangeNotifier {
  Map<String, MyModel> _datas = {};
  MyModel selectedItem;

  Map<String, dynamic> get datas {
    return {..._datas};
  }

  void setData(String key, MyModel data) {
    _datas.putIfAbsent(key, () => data);
    print("key : $key Length : ${_datas.values.toList().length}");
    notifyListeners();
  }

  void clearData() {
    print('data cleared');
    print('DATA : ' + _datas.toString());
    _datas = {};
    notifyListeners();
  }

  void setSelectedItem(MyModel value) {
    selectedItem = value;
    notifyListeners();
  }

  void clearSelectedItem() {
    selectedItem = null;
  }
}
