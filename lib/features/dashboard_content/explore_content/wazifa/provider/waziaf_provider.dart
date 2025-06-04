// import 'package:rehman_zone/features/dashboard_content/explore_content/inspiration/model/inspiration_model.dart';

// import 'package:rehman_zone/all_imports.dart';
// import 'package:rehman_zone/features/dashboard_content/explore_content/wazifa/model/waziaf_model.dart';

// class WaziafProvider with ChangeNotifier {
//   List<WaziafModel> _duaList = [];
//   bool _isLoading = false;

//   List<WaziafModel> get duaList => _duaList;
//   bool get isLoading => _isLoading;

//   WaziafProvider() {
//     loadDuas();
//   }

//   Future<void> loadDuas() async {
//     _isLoading = true;
//     notifyListeners();

//     final jsonStr = await rootBundle.loadString('asset/wazifa.json');
//     final List<dynamic> jsonList = json.decode(jsonStr);
//     _duaList = jsonList.map((e) => WaziafModel.fromJson(e)).toList();

//     _isLoading = false;
//     notifyListeners();
//   }
// }
