import 'package:flutter/cupertino.dart';
import 'package:magang/controler/api.dart';
import 'package:magang/enum/enum_check.dart';
import 'package:magang/model/user_login.dart';
import 'package:magang/model/user_request.dart';

class ApiUserProvider extends ChangeNotifier {
  final ApiService apiService;
  ApiUserProvider({required this.apiService});

  ResultState _state = ResultState.noData;
  ResultState get state => _state;

  ResultState _rState = ResultState.noData;
  ResultState get rState => _rState;
  String _massage = "";
  String get massage => _massage;

  Future<dynamic> login(UserLogin user) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getUser(user);
      _state = ResultState.hasData;
      notifyListeners();
      return response;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _massage = "";
    }
  }

  Future<dynamic> register(UserRequest user) async {
    // try {
    _state = ResultState.loading;
    notifyListeners();
    final response = await apiService.createUser(user);
    _state = ResultState.hasData;
    notifyListeners();
    return response;
    // } catch (e) {
    //   _state = ResultState.error;
    //   notifyListeners();
    //   return _massage = "Error, try check your internet connection";
    // }
  }
}

//   Future<dynamic> _fetchUpdate(int number) async {
//     try {
//       notifyListeners();
//       final listHeader = await apiService.userlist(2 + number, 8);
//       if (listHeader.data.isNotEmpty) {
//         _state = ResultState.hasData;
//         notifyListeners();
//         return _list.addAll(listHeader.data);
//       } else {
//         _state = ResultState.endCheck;
//         notifyListeners();
//         return _list;
//       }
//     } catch (e) {
//       _state = ResultState.error;
//       notifyListeners();
//       return _massage = "Error, try check your internet connection";
//     }
//   }
// }
