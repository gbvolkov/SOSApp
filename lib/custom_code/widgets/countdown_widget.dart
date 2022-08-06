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
    this.bgColorInt,
    this.activeTimerEvents,
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
  final int? bgColorInt;
  final List<String>? activeTimerEvents;
  final Future<dynamic> Function() onComplete;

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

String _getTime(Duration duration, textFormat) {
  // For HH:mm:ss format
  if (textFormat == countdown.CountdownTextFormat.HH_MM_SS) {
    return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  // For mm:ss format
  else if (textFormat == countdown.CountdownTextFormat.MM_SS) {
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  // For ss format
  else if (textFormat == countdown.CountdownTextFormat.SS) {
    return '${(duration.inSeconds).toString().padLeft(2, '0')}';
  }
  // For s format
  else if (textFormat == countdown.CountdownTextFormat.S) {
    return '${(duration.inSeconds)}';
  } else {
    // Default format
    return _defaultFormat(duration);
  }
}

_defaultFormat(Duration duration) {
  if (duration.inHours != 0) {
    return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  } else if (duration.inMinutes != 0) {
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  } else {
    return '${duration.inSeconds % 60}';
  }
}

class _CountdownWidgetState extends State<CountdownWidget> {
  countdown.CountDownController? _controller;
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = countdown.CountDownController();
    isStarted = false;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle =
        TextStyle(color: widget.textColor, fontSize: widget.textFontSize);
    //controller.start();
    if (isStarted) _controller?.restart();
    return GestureDetector(
        onTap: (widget.activeTimerEvents?.contains('onTap') ?? true)
            ? () async {
                await widget.onComplete();
                setState(() {
                  isStarted = true;
                  //_controller?.restart();
                });
              }
            : null,
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
                backgroundColor: (widget.bgColorInt != null)
                    ? Color(widget.bgColorInt!)
                    : widget.backgroundColor ?? Colors.purple[500],
                strokeWidth: widget.strokeWidth ?? 5.0,
                textStyle: txtStyle,
                textFormat: widget.textFormat,
                isReverse: widget.isReverse ?? false,
                isReverseAnimation: widget.isReverseAnimation ?? false,
                isTimerTextShown: widget.isTimerTextShown ?? false,
                autoStart: widget.autoStart ?? true,
                controller: _controller,
                // This Callback will execute when the Countdown Ends.
                onComplete: () async {
                  String? tsString = _controller?.getTime();
                  String? zeroTime = _getTime(
                      (widget.isReverse ?? false)
                          ? Duration(
                              days: 0,
                              hours: 0,
                              minutes: 0,
                              seconds: 0,
                              milliseconds: 0,
                              microseconds: 0)
                          : Duration(seconds: widget.duration ?? 10),
                      widget.textFormat);
                  if (tsString! == zeroTime) {
                    //debugPrint();
                    if (widget.activeTimerEvents?.contains('onComplete') ??
                        true) {
                      await widget.onComplete();
                    }
                    setState(() {
                      isStarted = true;
                      //_controller?.restart();
                    });
                  }
                },
                //onChange: (String ts) async {},
              ),
              (widget.label?.isNotEmpty ?? false)
                  ? Align(
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
                    )
                  : Align(),
            ])));
  }
}
