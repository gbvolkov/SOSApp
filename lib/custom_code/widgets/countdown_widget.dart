// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:circular_countdown_timer/circular_countdown_timer.dart'
    as countdown;

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({
    Key? key,
    this.width,
    this.height,
    this.duration,
    this.initialDuration,
    this.ringColor,
    this.fillColor,
    this.backgroundColor,
    this.strokeWidth,
    this.textColor,
    this.textFontSize,
    this.textFormat,
    this.isReverse,
    this.isReverseAnimation,
    this.isTimerTextShown,
    this.autoStart,
    this.label,
    required this.onComplete,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? duration;
  final int? initialDuration;
  final Color? ringColor;
  final Color? fillColor;
  final Color? backgroundColor;
  final double? strokeWidth;
  final Color? textColor;
  final double? textFontSize;
  final String? textFormat;
  final bool? isReverse;
  final bool? isReverseAnimation;
  final bool? isTimerTextShown;
  final bool? autoStart;
  final String? label;
  final Future<dynamic> Function() onComplete;

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  final countdown.CountDownController controller =
      countdown.CountDownController();
  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle =
        TextStyle(color: widget.textColor, fontSize: widget.textFontSize);
    return GestureDetector(
        onTap: () async {
          controller.restart();
          await widget.onComplete();
        },
        child: Container(
            width: widget.width ?? 100,
            height: widget.height ?? 100,
            child: Stack(children: [
              countdown.CircularCountDownTimer(
                duration: widget.duration ?? 10,
                initialDuration: widget.initialDuration ?? 0,
                width: widget.width ?? 100,
                height: widget.height ?? 100,
                ringColor: widget.ringColor ?? Colors.grey[300]!,
                fillColor: widget.fillColor ?? Colors.purpleAccent[100]!,
                backgroundColor: widget.backgroundColor ?? Colors.purple[500],
                strokeWidth: widget.strokeWidth ?? 5.0,
                textStyle: txtStyle,
                textFormat: widget.textFormat,
                isReverse: widget.isReverse ?? false,
                isReverseAnimation: widget.isReverseAnimation ?? false,
                isTimerTextShown: widget.isTimerTextShown ?? false,
                autoStart: widget.autoStart ?? true,
                controller: controller,
                // This Callback will execute when the Countdown Ends.
                onComplete: () async {
                  // Here, do whatever you want
                  controller.restart();
                  await widget.onComplete();
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: 100,
                  height: 100,
                  constraints: const BoxConstraints(
                    maxWidth: 75,
                    maxHeight: 35,
                  ),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor ?? Colors.purple[500],
                    shape: BoxShape.rectangle,
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    widget.label ?? "",
                    textAlign: TextAlign.center,
                    style: txtStyle,
                  ),
                ),
              ),
            ])));
  }
}
