import 'package:rehman_zone/features/dashboard_content/explore_content/inspiration/model/inspiration_model.dart';

import 'package:rehman_zone/all_imports.dart';

class InspirationProvider with ChangeNotifier {
  List<InspirationModel> _duaList = [];
  bool _isLoading = false;

  List<InspirationModel> get duaList => _duaList;
  bool get isLoading => _isLoading;

  InspirationProvider() {
    loadDuas();
  }

  Future<void> loadDuas() async {
    _isLoading = true;
    notifyListeners();

    final jsonStr = await rootBundle.loadString('asset/quotes.json');
    final List<dynamic> jsonList = json.decode(jsonStr);
    _duaList = jsonList.map((e) => InspirationModel.fromJson(e)).toList();

    _isLoading = false;
    notifyListeners();
  }
}
