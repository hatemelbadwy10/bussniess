
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          color:  AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
             '2',
              style: Styles.number25,
            ),
            const SizedBox(height: 6),
            Text(
             ' requestData.value',
              style: Styles.text22
                  .copyWith(letterSpacing: 1.5, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
