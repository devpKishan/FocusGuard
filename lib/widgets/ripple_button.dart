import 'package:flutter/material.dart';
import 'package:ripple_wave/ripple_wave.dart';

class RippleIconButton extends StatefulWidget {
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final double size;
  final TextStyle? textStyle;
  final Duration? rippleDuration;

  const RippleIconButton({
    Key? key,
    required this.icon,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeText,
    required this.inactiveText,
    this.size = 100.0,
    this.textStyle,
    this.rippleDuration,
  }) : super(key: key);

  @override
  _RippleIconButtonState createState() => _RippleIconButtonState();
}

class _RippleIconButtonState extends State<RippleIconButton> {
  bool _isActive = false;

  void _toggleButton() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color currentColor = _isActive ? widget.activeColor : widget.inactiveColor;
    final String currentText = _isActive ? widget.activeText : widget.inactiveText;

    return GestureDetector(
      onTap: _toggleButton,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // if (_isActive)
                RippleWave(
                  color: currentColor.withOpacity(0.4),
                  childTween: Tween(begin: 0.0, end: 1.0),
                  repeat: true,
                  child: _buildIconContainer(currentColor),
                )
              // else
              //   _buildIconContainer(currentColor),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            currentText,
            style: widget.textStyle ??
                TextStyle(
                  color: currentColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(Color color) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          // if (_isActive)
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 5,
            ),
        ],
      ),
      child: Icon(
        widget.icon,
        color: Colors.white,
        size: widget.size * 0.5,
      ),
    );
  }
}
