import 'package:flutter/material.dart';

class SwitchC extends StatelessWidget {
  final ValueChanged<bool> onToggle;
  final bool isActive;

  const SwitchC({
    super.key,
    required this.onToggle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: onToggle, // Directly use the callback
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
          return Icon(
            isActive ? Icons.nightlight_round : Icons.wb_sunny,
            color: states.contains(WidgetState.selected)
                ? Colors.amber
                : Colors.blue,
            size: 20,
          );
        },
      ),
      activeTrackColor: const Color.fromARGB(255, 158, 158, 158) ,
      inactiveTrackColor: const Color.fromARGB(255, 31, 150, 248) ,
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          return states.contains(WidgetState.selected)
              ? Colors.grey[300]
              : Colors.blue[100];
        },
      ),
      thumbColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          return Colors.white;
        },
      ),
    );
  }
}
