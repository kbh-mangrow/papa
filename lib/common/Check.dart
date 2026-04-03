import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  final bool value;
  final String checked;
  final String unchecked;
  final double size;
  final String label;
  final TextStyle? style;
  final ValueChanged<bool> onChanged;

  const Check({
    super.key,
    required this.value,
    required this.checked,
    required this.unchecked,
    required this.size,
    required this.label,
    this.style,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 위 정렬
        children: [
          Image.asset(
            value ? checked : unchecked,
            width: size,
            height: size,
          ),
          const SizedBox(width: 8),
          // 텍스트를 Flexible로 감싸서 줄바꿈 가능하게 함
          Flexible(
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: style ?? const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}