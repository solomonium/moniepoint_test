import 'package:monie_point/export.dart';

class CustomTextField<T> extends StatefulWidget {
  final String? label;
  final String hint;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final Color? fillColor;
  final bool? obscureText;
  final void Function(String)? onChanged; // New onChanged property
  final List<T>? items; // Make items parameter optional
  final FocusNode? focusNode; // Optional focusNode property

  const CustomTextField({
    Key? key,
    this.label,
    required this.hint,
    required this.controller,
    required this.textInputAction,
    required this.keyBoardType,
    this.validator,
    this.borderRadius,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.items, // Make items parameter optional
    this.focusNode, // Optional focusNode property
  }) : super(key: key);

  @override
  _CustomTextFieldState<T> createState() => _CustomTextFieldState<T>();
}

class _CustomTextFieldState<T> extends State<CustomTextField<T>> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: MoniePointTestColors.primaryText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyBoardType,
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText ?? false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        prefixIconColor: MoniePointTestColors.primaryText,
        filled: true,
        fillColor: widget.fillColor ?? MoniePointTestColors.background,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
        ),
      ),
      validator: widget.validator,
    );
  }
}
