// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class MoodContainerWidget extends StatefulWidget {
  const MoodContainerWidget({
    Key? key,
    this.width,
    this.height,
    this.moodIndex,
    this.moodColors,
    this.borderRadius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? moodIndex;
  final List<int>? moodColors;
  final double? borderRadius;

  @override
  _MoodContainerWidgetState createState() => _MoodContainerWidgetState();
}

class _MoodContainerWidgetState extends State<MoodContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Color((widget.moodColors?[widget.moodIndex!] ?? 0) & 0x22FFFFFF),
        borderRadius: (widget.borderRadius != null)
            ? BorderRadius.circular(widget.borderRadius!)
            : null,
      ),
    );
  }
}
