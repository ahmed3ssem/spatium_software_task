import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashTextItem extends StatelessWidget {

  final String text;
  final Color color1;
  final Color color2;
  const SplashTextItem({super.key,
    required this.text,
    required this.color1,
    required this.color2,
  });

  List<TextSpan> _generateSpans() {
    List<TextSpan> spans = [];
    for (int i = 0; i < text.length; i += 2) {
      spans.add(
        TextSpan(
          text: text.substring(i, i + 2),
          style: TextStyle(
            color: (i % 4 == 0) ? color1 : color2,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700
          ),
        ),
      );
    }
    return spans;
  }
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _generateSpans(),
      ),
    );
  }
}
