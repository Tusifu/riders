import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders/utilities/constants.dart';

class TTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool isEmail;
  final String? customErrorMessage; // Add custom error message

  const TTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
    this.prefixIcon,
    this.isEmail = false,
    this.customErrorMessage, // Initialize custom error message
  });

  @override
  _TTextFieldState createState() => _TTextFieldState();
}

class _TTextFieldState extends State<TTextField> {
  bool _isObscured = true;
  bool _hasError = false;
  bool _isFocused = false;
  String? _errorMessage;

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
          },
          child: Stack(
            children: [
              CupertinoTextField(
                controller: widget.controller,
                obscureText: widget.isPassword ? _isObscured : false,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                placeholder: _isFocused || widget.controller.text.isNotEmpty
                    ? null
                    : widget.labelText,
                prefix: widget.prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: widget.prefixIcon,
                      )
                    : null,
                suffix: widget.isPassword
                    ? CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          !_isObscured
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      )
                    : null,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: _hasError
                        ? errorColor
                        : _isFocused
                            ? primaryColor
                            : CupertinoColors.lightBackgroundGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onChanged: (value) {
                  setState(() {
                    _errorMessage = widget.customErrorMessage;
                    _hasError = _validate(value);
                  });
                },
                focusNode: _focusNode, // Attach FocusNode
              ),
              Positioned(
                top: _isFocused || widget.controller.text.isNotEmpty ? 0 : 16,
                left: 12,
                child: AnimatedOpacity(
                  opacity: _isFocused || widget.controller.text.isNotEmpty
                      ? 1.0
                      : 0.0,
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
                            _isFocused || widget.controller.text.isNotEmpty
                                ? 12
                                : 16,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _errorMessage ??
                  widget.customErrorMessage ??
                  (widget.isPassword
                      ? 'At least one number or special character required'
                      : 'Invalid email address'),
              style: const TextStyle(
                color: errorColor,
                fontSize: 12,
              ),
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

  bool _validate(String value) {
    if (widget.isPassword) {
      final regex = RegExp(r'^(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$');
      return !regex.hasMatch(value);
    } else if (widget.isEmail) {
      final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      return !regex.hasMatch(value);
    }
    return false;
  }
}
