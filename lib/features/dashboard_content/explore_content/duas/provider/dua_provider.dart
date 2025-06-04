import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/duas/model/dua_model.dart';

class DuaProvider with ChangeNotifier {
  List<DuaModel> _duaList = [];
  bool _isLoading = false;

  List<DuaModel> get duaList => _duaList;
  bool get isLoading => _isLoading;

  DuaProvider() {
    loadDuas();
  }
  Future<void> loadDuas() async {
    _isLoading = true;
    notifyListeners();

    final jsonStr = await rootBundle.loadString('asset/duas.json');
    final List<dynamic> jsonList = json.decode(jsonStr);
    _duaList = jsonList.map((e) => DuaModel.fromJson(e)).toList();

    _isLoading = false;
    notifyListeners();
  }
}
