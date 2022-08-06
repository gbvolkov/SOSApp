// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:slide_switcher/slide_switcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SlideSwitcherGV extends StatefulWidget {
  ///Widgets that placed inside sliders
  final List<Widget> children;

  ///The function takes an index variable, which varies depending on the index of the current slider
  final void Function(int index) onSelect;

  ///Container height
  final double containerHeight;

  ///Container width
  final double containerWight;

  ///The color of each slider. A single color in the array will fill all sliders
  final List<Color> slidersColors;

  ///The gradient of each slider. A single gradient in the array will fill all sliders
  final List<LinearGradient> slidersGradients;

  ///Container border widget
  final Border containerBorder;

  ///Slider border widget
  final Border slidersBorder;

  ///Container corner rounding radius
  final double containerBorderRadius;

  ///Container fill color
  final Color containerColor;

  ///Indents between the container and the sliders (the same on all sides)
  final double indents;

  ///Defining the direction of the slider swipe
  final Axis direction;

  ///A shadow cast by a box
  final List<BoxShadow> containerBoxShadow;

  ///Ability to tap on the current slider and change its index to the opposite (available only for 2 children)
  final bool isAllContainerTap;

  final int index;

  ///A class for creating sliders
  const SlideSwitcherGV({
    Key? key,
    required this.children,
    required this.containerHeight,
    required this.containerWight,
    required this.onSelect,
    this.index = 0,
    this.containerBorder = const Border(),
    this.slidersBorder = const Border(),
    this.indents = 0,
    this.slidersColors = const [Colors.white],
    this.slidersGradients = const [],
    this.containerColor = Colors.grey,
    this.containerBorderRadius = 1000,
    this.direction = Axis.horizontal,
    this.containerBoxShadow = const [],
    this.isAllContainerTap = false,
  }) : super(key: key);

  @override
  _SlideSwitcherGVState createState() => _SlideSwitcherGVState();
}

class _SlideSwitcherGVState extends State<SlideSwitcherGV>
    with SingleTickerProviderStateMixin {
  late final double sliderBorderRadius;
  late final double slidersHeight;
  late final double slidersWight;
  late final double containerBorderHeight;
  late final double containerBorderWight;
  late final bool verticalBadSize;
  late final bool horizontalBadSize;
  late final EdgeInsets padding;
  int index = 0;
  int lastIndex = -1;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: widget.direction == Axis.horizontal
        ? const Offset(1.0, 0.0)
        : const Offset(0.0, 1.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  @override
  void initState() {
    index = (widget.index < 0) ? 0 : widget.index;
    index = (index >= widget.children.length)
        ? (widget.children.length - 1)
        : index;
    lastIndex = index - 1;

    verticalBadSize = widget.direction == Axis.vertical &&
        widget.containerHeight < widget.containerWight * widget.children.length;

    horizontalBadSize = widget.direction == Axis.horizontal &&
        widget.containerHeight * widget.children.length > widget.containerWight;

    containerBorderHeight =
        widget.containerBorder.top.width + widget.containerBorder.bottom.width;

    containerBorderWight =
        widget.containerBorder.left.width + widget.containerBorder.right.width;

    sliderBorderRadius =
        (widget.containerHeight - widget.indents - containerBorderWight) *
            (widget.containerBorderRadius / widget.containerHeight);

    if (widget.direction == Axis.horizontal) {
      slidersHeight =
          widget.containerHeight - widget.indents * 2 - containerBorderHeight;
      padding = EdgeInsets.symmetric(horizontal: widget.indents);
      slidersWight =
          (widget.containerWight - widget.indents * 2 - containerBorderWight) /
              widget.children.length;
    } else {
      slidersWight =
          widget.containerWight - widget.indents * 2 - containerBorderWight;
      padding = EdgeInsets.symmetric(vertical: widget.indents);
      slidersHeight = (widget.containerHeight -
              widget.indents * 2 -
              containerBorderHeight) /
          widget.children.length;
    }
    //_slidersOnTap(index);

    if (widget.direction == Axis.horizontal) {
      offsetAnimation = Tween<Offset>(
        begin: Offset((lastIndex + 1).toDouble(), 0.0),
        end: Offset((containerBorderWight + 1).toDouble(), 0.0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ),
      );
    } else {
      offsetAnimation = Tween<Offset>(
        begin: Offset(0.0, (lastIndex + 1).toDouble()),
        end: Offset(0.0, (index + 1).toDouble()),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (lastIndex == -1) _checkForExceptions();
    return Container(
      height: widget.children.isEmpty ? 0 : widget.containerHeight,
      width: widget.children.isEmpty ? 0 : widget.containerWight,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(widget.containerBorderRadius),
        border: widget.containerBorder,
        boxShadow: widget.containerBoxShadow,
      ),
      child: Stack(
        alignment: widget.direction == Axis.horizontal
            ? Alignment.centerLeft
            : Alignment.topCenter,
        children: [
          Padding(
            padding: padding,
            child: SlideTransition(
              position: offsetAnimation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: slidersHeight,
                width: slidersWight,
                decoration: BoxDecoration(
                  border: widget.slidersBorder,
                  borderRadius: _makingBorder(index),
                  color: widget.slidersGradients.isEmpty
                      ? widget.slidersColors[
                          index + 1 > widget.slidersGradients.length
                              ? 0
                              : index]
                      : null,
                  gradient: widget.slidersGradients.isNotEmpty
                      ? widget.slidersGradients[
                          index + 1 > widget.slidersGradients.length
                              ? 0
                              : index]
                      : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: padding,
            child: Flex(
              direction: widget.direction,
              children: List.generate(
                widget.children.length,
                (slidersIndex) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _slidersOnTap(
                      widget.isAllContainerTap && widget.children.length == 2
                          ? 1 - index
                          : slidersIndex,
                    );
                  },
                  onHorizontalDragEnd: widget.direction == Axis.horizontal
                      ? (details) {
                          _slidersOnSwipe(details);
                        }
                      : null,
                  onVerticalDragEnd: widget.direction == Axis.vertical
                      ? (details) {
                          _slidersOnSwipe(details);
                        }
                      : null,
                  child: SizedBox(
                    height: slidersHeight,
                    width: slidersWight,
                    child: SizedBox(
                      child: Center(
                        child: widget.children[slidersIndex],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius _makingBorder(int index) {
    return BorderRadius.only(
      bottomLeft: index == 0 && verticalBadSize ||
              index == widget.children.length - 1 && horizontalBadSize
          ? Radius.zero
          : Radius.circular(sliderBorderRadius),
      bottomRight: index == 0 && (verticalBadSize || horizontalBadSize)
          ? Radius.zero
          : Radius.circular(sliderBorderRadius),
      topLeft: index == widget.children.length - 1 && verticalBadSize ||
              index == widget.children.length - 1 && horizontalBadSize
          ? Radius.zero
          : Radius.circular(sliderBorderRadius),
      topRight: index == widget.children.length - 1 && verticalBadSize ||
              index == 0 && horizontalBadSize
          ? Radius.zero
          : Radius.circular(sliderBorderRadius),
    );
  }

  void _slidersOnTap(int slidersIndex) {
    int iniIdx = lastIndex;
    lastIndex = index;
    index = slidersIndex;
    if (iniIdx != -1) {
      setState(() {});
      widget.onSelect(index);
    }
    if (widget.children.length == 2) {
      index == 1 ? _controller.forward() : _controller.reverse();
    } else {
      if (widget.direction == Axis.horizontal) {
        offsetAnimation = Tween<Offset>(
          begin: Offset(lastIndex.toDouble(), 0.0),
          end: Offset(index.toDouble(), 0.0),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.linear,
          ),
        );
      } else {
        offsetAnimation = Tween<Offset>(
          begin: Offset(0.0, lastIndex.toDouble()),
          end: Offset(0.0, index.toDouble()),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.linear,
          ),
        );
      }
      _controller.reset();
      _controller.forward();
    }
  }

  void _slidersOnSwipe(DragEndDetails details) {
    if (details.primaryVelocity! > 0 && index != widget.children.length - 1) {
      _slidersOnTap(index + 1);
    }
    if (details.primaryVelocity! < 0 && index != 0) {
      _slidersOnTap(index - 1);
    }
  }

  void _checkForExceptions() {
    if (widget.isAllContainerTap && widget.children.length != 2) {
      debugPrint(
          '\x1B[31mThe "isAllContainerTap" parameter can be "true" only when "children" length is 2\nRemove "isAllContainerTap" or make 2 "children"\x1B[0m');
      throw 'The "isAllContainerTap" parameter can be "true" only when "children" length is 2\nRemove "isAllContainerTap" or make 2 "children"';
    }

    double shortSide = widget.containerHeight > widget.containerWight
        ? widget.containerWight
        : widget.containerHeight;
    double longSide = widget.containerHeight > widget.containerWight
        ? widget.containerHeight
        : widget.containerWight;
    if (shortSide * widget.children.length * 0.5 > longSide &&
        widget.containerBorderRadius * 2 > shortSide &&
        widget.children.length != 2) {
      debugPrint(
          '\x1B[31mAll widgets from the list of "children" do not fit into the given container size.\nTry applying other container sizes\x1B[0m');
      throw 'All widgets from the list of "children" do not fit into the given container size.\nTry applying other container sizes';
    }
    lastIndex = 0;
  }
}

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
    this.index,
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
  final int? index;

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
  late int switcherIndex;

  @override
  void initState() {
    int switcherIndex = 0;
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
      child: SlideSwitcherGV(
        onSelect: (int index) async {
          FFAppState().sliderValue = index;
          await widget.onSelect();
          setState(() => switcherIndex = index);
          /*setState(() {
            //switcherIndex = index;
            
            Scaffold.of(context).setState(() {FFAppState().sliderValue = switcherIndex;});
          });*/
        },
        index: widget.index ?? 0,
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
