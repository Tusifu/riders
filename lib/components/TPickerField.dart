import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders/utilities/constants.dart';

class TPickerField extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String? selectedValue;
  final TextEditingController controller;
  final Widget? suffixIcon;

  const TPickerField({
    super.key,
    required this.labelText,
    required this.options,
    required this.onChanged,
    this.selectedValue,
    required this.controller,
    this.suffixIcon,
  });

  @override
  _TPickerFieldState createState() => _TPickerFieldState();
}

class _TPickerFieldState extends State<TPickerField> {
  bool _isFocused = false;
  String? _selectedValue;

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
    widget.controller.text = _selectedValue ?? '';
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _focusNode.requestFocus();
            _showPicker();
          },
          child: Stack(
            children: [
              CupertinoTextField(
                onTap: () {
                  _focusNode.requestFocus();
                  _showPicker();
                },
                readOnly: true,
                focusNode: _focusNode,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                placeholder: _isFocused || _selectedValue != null
                    ? null
                    : widget.labelText,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: _isFocused
                        ? CupertinoColors.activeGreen
                        : CupertinoColors.lightBackgroundGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                controller: widget.controller,
                suffix: widget.suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: widget.suffixIcon,
                      )
                    : null,
              ),
              Positioned(
                top: _isFocused || _selectedValue != null ? 0 : 16,
                left: 12,
                child: AnimatedOpacity(
                  opacity: _isFocused || _selectedValue != null ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      widget.labelText,
                      style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize:
                            _isFocused || _selectedValue != null ? 12 : 16,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _showPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Close the modal without selecting
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: errorColor),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Use the value selected in the picker
                      if (_selectedValue != null) {
                        widget.controller.text = _selectedValue!;
                        widget.onChanged(_selectedValue);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                onSelectedItemChanged: (index) {
                  setState(() {
                    _selectedValue = widget.options[index];
                  });
                },
                itemExtent: 32.0,
                children: widget.options.map((item) => Text(item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
