import 'package:monie_point/export.dart';
import 'package:monie_point/utils/colors.dart';

class PrimaryText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const PrimaryText({
    super.key,
    this.color,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      style: TextStyle(
          color: color ?? MoniePointTestColors.primaryText,
          fontSize: fontSize ?? 24.0,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: 'Candara'),
    );
  }
}
