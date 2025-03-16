
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class TapSwitcher extends StatelessWidget {
  const TapSwitcher(
      {required this.title,
        this.switcherDefaultValue = false,
        required this.onTap,
        super.key});
  final String title;
  final bool switcherDefaultValue;
  final Function(bool)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Styles.text18,
            ),
          ),
          Switcher(
            switcherDefaultValue,
            currentState: onTap,
          ),
        ],
      ),
    );
  }
}


class Switcher extends StatefulWidget {
  const Switcher(this.value, {this.currentState, super.key});
  final bool value;
  final Function(bool)? currentState;

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  late bool swithcerState = widget.value;
  @override
  Widget build(BuildContext context) {
    return SwitchTheme(
      data: const SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Switch.adaptive(
        value: swithcerState,
        onChanged: (newValue) {
          setState(() {
            swithcerState = newValue;
          });
          if (widget.currentState == null) return;
          widget.currentState!(newValue);
        },
        activeColor: AppColors.primaryColor,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}
