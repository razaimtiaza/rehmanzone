import 'package:rehman_zone/all_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leftIcon;
  final IconData menuIcon;
  final VoidCallback onMenuPressed;
  final VoidCallback onLeftIconPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.menuIcon,
    required this.onMenuPressed,
    required this.onLeftIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(menuIcon, color: Colors.white),
        onPressed: onMenuPressed,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Icon(leftIcon, color: Colors.white),
          onPressed: onLeftIconPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
