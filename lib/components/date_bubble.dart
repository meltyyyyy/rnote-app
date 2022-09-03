import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateBubble extends StatelessWidget {
  const DateBubble({Key? key, required this.date, required this.onTap})
      : super(key: key);

  final DateTime date;
  final VoidCallback onTap;

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
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.close,
                size: 18,
                color: Colors.black54,
              ),
            )
          ],
        ));
  }
}
