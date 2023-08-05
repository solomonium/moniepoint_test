import 'package:monie_point/export.dart';
import 'package:monie_point/utils/colors.dart';

class SecondaryText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const SecondaryText({
    super.key,
    this.color,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? MoniePointTestColors.secondaryText,
          fontSize: fontSize ?? 15.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Candara'),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
