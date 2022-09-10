import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodSliderWidget extends StatefulWidget {
  const MoodSliderWidget({
    Key? key,
    this.width,
    this.height,
    this.activeColor,
    this.inactiveColor,
    this.onChange,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? activeColor;
  final Color? inactiveColor;
  final Future<dynamic> Function()? onChange;

  @override
  _MoodSliderWidgetState createState() => _MoodSliderWidgetState();
}

class _MoodSliderWidgetState extends State<MoodSliderWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 65,
        height: 320,
        child: custom_widgets.MoodSelectorWidget(
          width: 65,
          height: 320,
          isVertical: true,
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          iconSize: 24.0,
          gradientColors: FFAppState().sliderColors.toList(),
          gradientStops: FFAppState().sliderGradientStops.toList(),
          sliderStops: FFAppState().sliderStops.toList(),
          onSelect: () async {
            await widget.onChange?.call();
            setState(() => FFAppState().sliderValue = 1);
          },
        ),
      ),
    );
  }
}
