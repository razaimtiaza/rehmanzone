import 'package:rehman_zone/all_imports.dart';

class HadithProvider extends ChangeNotifier {
  final HadithRepository _repository = hadithLocalStorage();
  List<HadithTopicModel> _hadith = [];
  bool _isLoading = true;
  String? _error;
  bool get isLoading => _isLoading;

  List<HadithTopicModel> get hadith => _hadith;

  HadithProvider() {
    fetchHadith();
  }
  Future<void> fetchHadith() async {
    try {
      _isLoading = true;
      notifyListeners(); // Notify listeners about loading state

      _hadith = await _repository.getHadith();
    } catch (e) {
      _error = e.toString();
      debugPrint("Error fetching hadith: $_error");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about loading completion
    }
  }
}
