import 'package:flutter/cupertino.dart';

class CustomBackButton extends StatelessWidget {
  final String text;
  final Color color;

  const CustomBackButton({
    super.key,
    this.text = 'Back',
    this.color = CupertinoColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensures the Row takes up only the necessary space
          children: [
            Icon(
              CupertinoIcons.back,
              color: color,
            ),
            const SizedBox(width: 8),
            Flexible(
              // Prevents overflow by wrapping text
              child: Text(
                text,
                style: TextStyle(
                    color: color, fontSize: 17, fontWeight: FontWeight.w300),
                textAlign: TextAlign.left,
                overflow: TextOverflow.fade, // Ellipsis if the text is too long
              ),
            ),
          ],
        ),
      ),
    );
  }
}
