import 'package:calc/utils/constants.dart';
// hide -> для того чтобы взять свои boxshadow и boxdecoration, не из материала
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ! enum -> Перечисления в Dart или enum представляют особый тип классов, который представляет фиксированный набор константных значений. Для определения перечисления применяется ключевое слово enum.
// ? shape -> Фигура для заливки фоновым цветом , градиентом и изображением и приведения ее в качестве boxShadow. Если это BoxShape.circle , то borderRadius игнорируется.
enum Shape {
  square,
  circle,
  stadium,
}

class CalculatorButton extends ConsumerStatefulWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;

  const CalculatorButton({
    super.key,
    // required - обязательно
    required this.text,
    this.textColor = kSecondaryColor,
    this.fontSize = 40,
    this.fontWeight = FontWeight.bold,
    this.width = 68,
    this.shape = Shape.square,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalculatorButtonState();
}

class _CalculatorButtonState extends ConsumerState<CalculatorButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(widget.shape == Shape.square ? 20 : 36);

    final shape =
        widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;

    return Listener(
      onPointerDown: (event) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (event) => setState(() {
        isPressed = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: const Color(0x80FFFFFF),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: const Color(0x80838E9E),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              // transparent -> прозрачный
              color: isPressed ? Colors.transparent : const Color(0xCCFFFFFF),
              inset: true,
            ),
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0x66838E9E),
              inset: true,
            )
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
