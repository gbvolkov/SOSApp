// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:slide_switcher/slide_switcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoodSelectorWidget extends StatefulWidget {
  const MoodSelectorWidget({
    Key? key,
    this.width,
    this.height,
    this.isVertical,
    this.iconColor,
    this.iconSize,
    this.gradientColors,
    this.gradientStops,
    this.sliderStops,
    required this.onSelect,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? iconColor;
  final double? iconSize;
  final bool? isVertical;
  final List<int>? gradientColors;
  final List<double>? gradientStops;
  final List<double>? sliderStops;
  final Future<dynamic> Function() onSelect;

  @override
  // ignore: library_private_types_in_public_api
  _MoodSelectorWidgetState createState() => _MoodSelectorWidgetState();
}

void forEach<T>(List<T> list, void Function(T current, T? next) action) {
  for (var i = 0; i < list.length; i++) {
    T current = list[i];
    T? next = (i + 1 < list.length ? list[i + 1] : null);
    action(current, next);
  }
}

List<Color>? getColors(List<int>? colorValues) {
  if (colorValues == null) return null;
  List<Color> colors = [];
  for (var colorValue in colorValues) {
    colors.add(Color(colorValue));
  }

  return colors;
}

class _MoodSelectorWidgetState extends State<MoodSelectorWidget> {
  int switcherIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = getColors(widget.gradientColors) ??
        [
          const Color.fromRGBO(45, 237, 99, 1),
          const Color.fromRGBO(159, 223, 28, 1),
          const Color.fromRGBO(244, 248, 74, 1),
          const Color.fromRGBO(246, 195, 68, 1),
          const Color.fromRGBO(249, 129, 62, 1),
          const Color.fromRGBO(252, 58, 46, 1),
        ].toList();
    List<double> stops = widget.gradientStops ?? [0, 0.3, 0.5, 0.7, 0.8, 1];
    List<LinearGradient> slidersGradients = [];
    forEach(colors, (Color current, Color? next) {
      if (next != null) {
        slidersGradients.add(LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: widget.sliderStops ?? const [0.7, 1],
          colors: [
            current,
            next,
          ],
        ));
      }
    });

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //colors: [Color(0xFF2DED63), Color(0xFFFC3A2E)],
          colors: colors,
          stops: stops,
          begin: const AlignmentDirectional(0, -1),
          end: const AlignmentDirectional(0, 1),
        ),
        borderRadius: BorderRadius.circular(90),
      ),
      width: widget.width,
      height: widget.height,
      child: SlideSwitcher(
        onSelect: (int index) async {
          await widget.onSelect();
          setState(() {
            switcherIndex = index;
            FFAppState().sliderValue = switcherIndex;
            //context.dispatchNotification(notification)
          });
        },
        slidersGradients: slidersGradients,
        containerHeight: widget.height ?? 320,
        containerWight: widget.width ?? 65,
        indents: 4,
        direction:
            (widget.isVertical ?? true) ? Axis.vertical : Axis.horizontal,
        containerColor: Colors.transparent,
        slidersBorder: const Border(
          top: BorderSide(color: Color.fromRGBO(246, 195, 68, 1), width: 1),
          right: BorderSide(color: Color.fromRGBO(246, 195, 68, 1), width: 1),
          left: BorderSide(color: Color.fromRGBO(246, 195, 68, 1), width: 1),
          bottom: BorderSide(color: Color.fromRGBO(246, 195, 68, 1), width: 1),
        ),
        children: [
          FaIcon(
            FontAwesomeIcons.grinHearts,
            color: widget.iconColor ?? Colors.white,
            size: widget.iconSize ?? 24,
          ),
          FaIcon(
            FontAwesomeIcons.smile,
            color: widget.iconColor ?? Colors.white,
            size: widget.iconSize ?? 24,
          ),
          FaIcon(
            FontAwesomeIcons.meh,
            color: widget.iconColor ?? Colors.white,
            size: widget.iconSize ?? 24,
          ),
          FaIcon(
            FontAwesomeIcons.frownOpen,
            color: widget.iconColor ?? Colors.white,
            size: widget.iconSize ?? 24,
          ),
          FaIcon(
            FontAwesomeIcons.sadCry,
            color: widget.iconColor ?? Colors.white,
            size: widget.iconSize ?? 24,
          ),
        ],
        //containerBorderRadius: 90,
      ),
    );
  }
}
