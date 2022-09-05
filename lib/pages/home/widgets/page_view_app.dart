import 'package:flutter/cupertino.dart';
import 'package:nubank/pages/home/widgets/card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;

  const PageViewApp({super.key, required this.top, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      height: MediaQuery.of(context).size.height * .45,
      left: 0,
      right: 0,
      child: PageView(
        onPageChanged: onChanged,
        physics: const BouncingScrollPhysics(),
        children: const [CardApp(), CardApp(), CardApp()],
      ),
    );
  }
}
