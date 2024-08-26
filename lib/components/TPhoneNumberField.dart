import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class TPhoneNumberField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String initialCountryCode;

  const TPhoneNumberField({
    super.key,
    required this.labelText,
    required this.controller,
    this.initialCountryCode = 'RW',
  });

  @override
  _TPhoneNumberFieldState createState() => _TPhoneNumberFieldState();
}

class _TPhoneNumberFieldState extends State<TPhoneNumberField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      child: Container(
        height: 55.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isFocused
                ? CupertinoColors.activeGreen
                : CupertinoColors.systemGrey4,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: IntlPhoneField(
            disableLengthCheck: true,
            autovalidateMode: AutovalidateMode.disabled,
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: _isFocused
                    ? CupertinoColors.black
                    : CupertinoColors.inactiveGray,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
              hintStyle: const TextStyle(
                color: CupertinoColors.systemGrey,
              ),
            ),
            initialCountryCode: widget.initialCountryCode,
            style: const TextStyle(
              fontSize: 16.0,
              color: CupertinoColors.systemGrey,
            ),
            dropdownIcon: const Icon(
              CupertinoIcons.chevron_down,
              color: CupertinoColors.systemGrey,
              size: 20.0,
            ),
            dropdownTextStyle: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 16.0,
            ),
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            cursorColor: CupertinoColors.black,
          ),
        ),
      ),
    );
  }
}
