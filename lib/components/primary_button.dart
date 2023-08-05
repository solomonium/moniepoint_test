import 'package:monie_point/export.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Color? btnTextColor;
  final String buttonText;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.btnTextColor,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? MoniePointTestColors.clickableText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 37.0),
      ),
      child: SecondaryText(
        text: buttonText,
        color: btnTextColor ?? MoniePointTestColors.background,
        fontSize: 18,
        // color: NimvasColors.background,
      ),
    );
  }
}
