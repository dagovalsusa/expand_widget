import 'package:flutter/material.dart';

/// This widget is used in both [ExpandChild] & [ExpandText] widgets to show
/// the hidden information to the user. It posses an [animation] parameter.
/// Most widget parameters, such as [size] & [color] are customizable.
class ExpandArrow extends StatefulWidget {
  /// Message used as a tooltip when the widget is minimized
  final String minMessage;

  /// Message used as a tooltip when the widget is maximazed
  final String maxMessage;

  /// Controlls the arrow fluid(TM) animation
  final Animation<double> animation;

  /// Callback to controll what happeds when the arrow is clicked
  final Function onTap;

  /// Defines arrow's color
  final Color color;

  /// Defines arrow's size
  final double size;

  const ExpandArrow({
    Key key,
    this.minMessage,
    this.maxMessage,
    @required this.animation,
    @required this.onTap,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  _ExpandArrowState createState() => _ExpandArrowState();
}

class _ExpandArrowState extends State<ExpandArrow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // direction: Axis.vertical,
      children: [
      Text(message),
      Tooltip(
        message: message,
        child: InkResponse(
          child: RotationTransition(
            turns: widget.animation,
            child: Icon(
              Icons.expand_more,
              color: widget.color ?? Theme.of(context).textTheme.caption.color,
              size: widget.size,
            ),
          ),
          onTap: widget.onTap,
        ),
      ),
    ]);
  }

  /// Shows a tooltip message depending on the [animation] state.
  String get message =>
      widget.animation.value == 0 ? widget.minMessage : widget.maxMessage;
}
