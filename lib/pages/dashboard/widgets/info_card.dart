import 'package:flutter/material.dart';
import '../../../core/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class InfoCard extends StatefulWidget {
  final String? title;
  final String? value;
  final bool? isActive;
  final Function()? onTap;
  final IconData? icon;
  const InfoCard({
    Key? key,
    this.title,
    this.value,
    this.isActive = false,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool _favorite = false;
  void _incrementEnter(PointerEvent details) {
    setState(() {
      _favorite = true;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _favorite = false;
    });
  }

  Color setIconColor() {
    if (_favorite) {
      return Colors.white;
    }
    return Colors.grey;
  }

  Color setTextColor() {
    if (_favorite) {
      return Colors.white;
    }
    return Colors.grey;
  }

  Color setColor() {
    if (_favorite) {
      return const Color(0xFF2196F3);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    Size _size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onExit: _incrementExit,
      child: Container(
        height: _size.height * 0.16, //140,
        width: _size.width * 0.113, //156,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: themeProvider.isDarkMode
                ? _favorite
                    ? const Color(0xFF2196F3)
                    : const Color(0xFF212936)
                : setColor(),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: themeProvider.isDarkMode
                    ? const Color(0xFF212936)
                    : Colors.grey[300]!)),
        child: Column(
          children: [
            Expanded(child: Container()),
            Icon(
              widget.icon!,
              color: setIconColor(),
              size: 35,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.value}\n',
                    style: TextStyle(
                      fontSize: 24,
                      color: setTextColor(),
                    ),
                  ),
                  TextSpan(
                    text: '${widget.title}',
                    style: TextStyle(
                      fontSize: 12,
                      color: setTextColor(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
