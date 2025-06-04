import 'package:rehman_zone/activities/allah_name/model/allah_name_model.dart';
import 'package:rehman_zone/activities/allah_name/model/source/logic/allah_name_logic.dart';

import 'package:rehman_zone/all_imports.dart';

class AllahNameProvider extends ChangeNotifier {
  List<AllahNameModel> allahnameList = [];

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final AllahNameRepository _repository = AllahNameRepository();
  AllahNameProvider() {
    fetchTasbihData();
  }
  Future<void> fetchTasbihData() async {
    try {
      _isLoading = true;

      allahnameList = await _repository.getTasbihList();
      debugPrint("tesbihhhh:$allahnameList");
      notifyListeners();
    } catch (e) {
      debugPrint("eeerrrrrrro:$e");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    } // Notify the UI
  }
}
