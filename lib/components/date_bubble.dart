import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateBubble extends StatelessWidget {
  const DateBubble({Key? key, required this.date, this.onTap, this.isRemovable = false})
      : super(key: key);

  final DateTime date;
  final VoidCallback? onTap;
  final bool isRemovable;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat('EEE, MMM dd').format(date),
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            if(isRemovable) ...<Widget>[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.black54,
                ),
              )
            ]
          ],
        ));
  }
}
