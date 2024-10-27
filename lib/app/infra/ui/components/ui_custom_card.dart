import 'package:flutter/material.dart';

import '../../infra.dart';

class UiCustomCard extends StatelessWidget {
  const UiCustomCard({
    super.key,
    this.haveTileOnLeft = false,
    this.colorTileOnLeft = Colors.white,
    this.color,
    required this.content,
    this.icons,
  });

  final bool haveTileOnLeft;
  final Color colorTileOnLeft;
  final Widget content;
  final List<Widget>? icons;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: color ?? UiColors.grey200,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Visibility(
              visible: haveTileOnLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: colorTileOnLeft,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(99),
                    bottomLeft: Radius.circular(99),
                  ),
                ),
                width: 12,
                height: double.infinity,
              ),
            ),
            Expanded(
              child: content.addPadding(
                EdgeInsets.symmetric(
                  horizontal: 12.width,
                  vertical: 12.height,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [if (icons != null) ...icons!],
            ),
          ],
        ),
      ),
    );
  }
}
