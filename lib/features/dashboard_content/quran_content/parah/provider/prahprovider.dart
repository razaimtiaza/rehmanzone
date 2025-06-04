import 'package:rehman_zone/all_imports.dart';

class PrahProvider extends ChangeNotifier {
  final PrahRepository _repository = PrahLocalStorage();
  List<PrahModel> _prah = [];
  List<Quran> _ayats = [];
  String? _error;
  String? get error => _error;
  // ignore: unused_field
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<PrahModel> get prah => _prah;
  List<Quran> get ayats => _ayats;

  PrahProvider() {
    fetchPrah();
  }

  Future<void> fetchPrah() async {
    try {
      _isLoading = true;
      notifyListeners(); // Notify listeners about loading state

      _prah = await _repository.getPrah();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    }
  }

  Future<List<Quran>> getPrah(int prahId) async {
    try {
      _isLoading = true;
      // notifyListeners(); // Notify listeners about loading state
      _ayats = await _repository.getQuransByPrah(prahId);
      // Fetch ayats based on Surah ID
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    }
    return _ayats;
  }
}
