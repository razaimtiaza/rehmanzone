import 'package:rehman_zone/activities/tasbih/model/tasbih_model.dart';
import 'package:rehman_zone/activities/tasbih/source/logic/tesbih_logic.dart';
import 'package:rehman_zone/all_imports.dart';

class TasbihProvider extends ChangeNotifier {
  List<TasbihModel> tasbihList = [];
  int counter = 0;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final TasbihRepository _repository = TasbihRepository();
  TasbihProvider() {
    fetchTasbihData();
  }
  Future<void> fetchTasbihData() async {
    try {
      _isLoading = true;

      tasbihList = await _repository.getTasbihList();
      debugPrint("tesbihhhh:$tasbihList");
      notifyListeners();
    } catch (e) {
      debugPrint("eeerrrrrrro:$e");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    } // Notify the UI
  }

  void countingTeshbih(int count, BuildContext context) {
    counter++;
    notifyListeners();
    if (counter == count) {
      Navigator.pop(context);
      counter = 0;
    }
  }
}
