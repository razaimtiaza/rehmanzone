import 'package:rehman_zone/activities/allah_name/model/allah_name_model.dart';
import 'package:rehman_zone/all_imports.dart';

class AllahNameDialog extends StatefulWidget {
  final List<AllahNameModel> allahNames;
  final int initialIndex;

  const AllahNameDialog({
    super.key,
    required this.allahNames,
    required this.initialIndex,
  });

  @override
  State<AllahNameDialog> createState() => _AllahNameDialogState();
}

class _AllahNameDialogState extends State<AllahNameDialog> {
  late PageController _pageController;
  String _selectedLanguage = 'urdu';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 350,
        width: double.maxFinite,
        child: Column(
          children: [
            /// Top bar with language menu
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                  icon: const Icon(Icons.more_vert),
                  itemBuilder:
                      (context) => const [
                        PopupMenuItem(value: 'urdu', child: Text('Urdu')),
                        PopupMenuItem(value: 'english', child: Text('English')),
                      ],
                ),
              ],
            ),

            /// PageView to swipe names
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.allahNames.length,
                itemBuilder: (context, index) {
                  final name = widget.allahNames[index];
                  final isUrdu = _selectedLanguage == 'urdu';

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: isUrdu ? name.arabic : name.englishName,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        color: AppColors.background,
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                        text: isUrdu ? name.urduMeaning : name.englishMeaning,
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        color: AppColors.background,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
