import 'package:rehman_zone/all_imports.dart';

class SurahProvider extends ChangeNotifier {
  final SurahRepository _repository = SurahLocalStorage();
  List<SurahModel> _surahs = [];
  bool _isLoading = true;
  String? _error;

  // Store the ayats in this list
  List<Quran> _ayats = [];
  bool _ayatsLoading = true;
  String? _ayatsError;

  List<SurahModel> get surahs => _surahs;
  List<Quran> get ayats => _ayats; // Add ayats getter
  bool get isLoading => _isLoading;
  String? get error => _error;

  bool get ayatsLoading => _ayatsLoading;
  String? get ayatsError => _ayatsError;

  SurahProvider() {
    fetchSurahs();
  }
  Future<void> fetchSurahs() async {
    try {
      _isLoading = true;
      notifyListeners(); // Notify listeners about loading state

      _surahs = await _repository.getAll();
    } catch (e) {
      _error = e.toString();
      debugPrint("error:$_error");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    }
  }

  Future<List<Quran>> getAyats(int surahId) async {
    try {
      _ayatsLoading = true;
      // notifyListeners(); // Notify listeners about loading state

      _ayats = await _repository
          .getQuransBySurah(surahId); // Fetch ayats based on Surah ID
    } catch (e) {
      _ayatsError = e.toString();
    } finally {
      _ayatsLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    }
    return _ayats;
  }
}
