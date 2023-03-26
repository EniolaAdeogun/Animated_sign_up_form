import 'package:flutter/material.dart';

class AnimatedHover extends StatefulWidget {
  const AnimatedHover({
    super.key,
    required this.child,
    this.size = const Size(440, 440),
    this.hoverColor = const Color(0xFFA3B18A),
    this.bgColor = const Color(0xFFE9EFF3),
    this.offset = const Offset(8, 8),
    this.curve = Curves.easeOutBack,
    this.duration = const Duration(milliseconds: 400),
    this.border = const Border(),
  });

  final Widget child;
  final Size size;
  final Color hoverColor, bgColor;
  final Offset offset;
  final Curve curve;
  final Duration duration;
  final Border border;

  @override
  State<AnimatedHover> createState() => _AnimatedHoverState();
}

class _AnimatedHoverState extends State<AnimatedHover> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.size.height,
          width: widget.size.width,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        AnimatedPositioned(
          duration: widget.duration,
          curve: widget.curve,
          right: _isHover ? widget.offset.dx : 0,
          top: _isHover ? -widget.offset.dy : 0,
          child: InkWell(
            onTap: () {},
            onHover: (hover) {
              setState(() {
                _isHover = hover;
              });
            },
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: widget.size.height,
              width: widget.size.width,
              decoration: BoxDecoration(
                  color: _isHover ? widget.hoverColor : Color(0xFFE9EFF3),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: widget.border),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
