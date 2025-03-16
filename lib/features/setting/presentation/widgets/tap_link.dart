import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';

class TapLink extends StatelessWidget {
  const TapLink(
      {required this.title,
        this.subTitle,
        this.subTitleColor,
        required this.onTap,
        super.key});
  final String title;
  final String? subTitle;
  final Color? subTitleColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.text18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Text(
                      subTitle ?? "",
                      style: Styles.text13.copyWith(color: subTitleColor),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              FontAwesomeIcons.caretRight,
              color: Colors.grey.shade600,
            )
          ],
        ),
      ),
    );
  }
}
