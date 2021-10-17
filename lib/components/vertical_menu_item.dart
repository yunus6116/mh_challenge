import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controller.dart';
import '../constants/style.dart';
import 'custom_text.dart';

class VertticalMenuItem extends StatelessWidget {
  final String? itemName;
  final void Function()? onTap;
  const VertticalMenuItem({Key? key, this.itemName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName!)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName!)
              ? const Color(0xFFE3F2FD)
              : Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: menuController.returnIconFor(itemName!),
              ),
              if (!menuController.isActive(itemName!))
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: menuController.isHovering(itemName!)
                      ? Colors.white
                      : lightGrey,
                ))
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: const Color(0xFF2196F3),
                  size: 18,
                  fontWeight: FontWeight.bold,
                ))
            ],
          ),
        ),
      ),
    );
  }
}
