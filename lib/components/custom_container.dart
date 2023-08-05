import 'package:monie_point/export.dart';

class CustomContainer extends StatefulWidget {
  final double? height;
  final double width;
  final Color? color;
  final double? borderRadius;
  final Widget child;
  final Widget? labelWidget;
  final bool addShadow; // New property for enabling/disabling shadow

  const CustomContainer({
    Key? key,
    this.height,
    required this.width,
    this.color,
    this.borderRadius,
    this.labelWidget,
    required this.child,
    this.addShadow = true, // Default value for addShadow is true
  }) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  late double _currentWidth;

  @override
  void initState() {
    super.initState();
    // _currentHeight = widget.height;
    _currentWidth = widget.width;
  }

  @override
  void didUpdateWidget(CustomContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.height != oldWidget.height) {
      setState(() {
        // _currentHeight = widget.height;
      });
    }
    if (widget.width != oldWidget.width) {
      setState(() {
        _currentWidth = widget.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          // height: _currentHeight,
          width: _currentWidth,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
            boxShadow: widget.addShadow
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : null,
          ),
          child: widget.child,
        ),
        // addVerticalSpace(20),
        widget.labelWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}
