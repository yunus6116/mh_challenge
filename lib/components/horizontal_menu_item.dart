import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'custom_text.dart';
import '../constants/controller.dart';
import '../constants/style.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String? itemName;
  final void Function()? onTap;
  const HorizontalMenuItem({
    Key? key,
    this.itemName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName!)
            : menuController.onHover('not hovering');
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName!)
                ? const Color(0xFFE3F2FD)
                : Colors.transparent,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName!),
                ),
                const SizedBox(
                  width: 35,
                ),
                if (!menuController.isActive(itemName!))
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color:
                        menuController.isHovering(itemName!) ? dark : lightGrey,
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
          )),
    );
  }
}
