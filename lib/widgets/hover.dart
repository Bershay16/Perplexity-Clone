import 'package:flutter/material.dart';

class HoverableIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color defaultColor;
  final Color hoverBgColor;
  final VoidCallback? onTap;

  const HoverableIcon({
    super.key,
    required this.icon,
    this.size = 22,
    this.defaultColor = Colors.white,
    this.hoverBgColor = const Color(0xFF1E1E1E),
    this.onTap,
  });

  @override
  _HoverableIconState createState() => _HoverableIconState();
}

class _HoverableIconState extends State<HoverableIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
            decoration: BoxDecoration(
              color:isHovered ? widget.hoverBgColor: Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(14),
            child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: widget.size,
                  end: isHovered ? widget.size + 10 : widget.size,
                ),
                duration: const Duration(milliseconds: 200),
                builder: (context, size, child) {
                  return Icon(
                    widget.icon,
                    size: size,
                    color: widget.defaultColor,
                  );
                })
            // Icon(
            //   widget.icon,
            //   size: isHovered ? widget.size + 10 : widget.size,
            //   color: widget.defaultColor,
            // ),
            ),
      ),
    );
  }
}
