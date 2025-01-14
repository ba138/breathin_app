import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.shadowColor,
    required this.title,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Color? shadowColor;
  final int maxLines;
  final String title;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withValues(alpha: 0.2),
            border: Border.all(
              color: AppColor.whiteColor,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor?.withValues(
                      alpha: 0.5,
                    ) ??
                    const Color(0x80000000),
                offset: const Offset(0, 2),
                blurRadius: 20, //
              ),
              BoxShadow(
                color: widget.shadowColor?.withValues(
                      alpha: 0.5,
                    ) ??
                    const Color(0x33FFFFFF),
                offset: const Offset(-4, 0),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText && hidden,
              maxLines: widget.maxLines,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: widget.prefixIcon,
                prefixIconColor:
                    widget.shadowColor ?? Colors.black.withValues(alpha: 0.8),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: AppColor.blackColor),
                filled: false,
                suffixIcon: widget.obscureText
                    ? Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => hidden = !hidden);
                          },
                          child: Icon(
                            hidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: hidden ? AppColor.blackColor : Colors.blue,
                            size: 18,
                          ),
                        ),
                      )
                    : null,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
              ),
              validator: widget.validator,
              selectionControls: MaterialTextSelectionControls(),
            ),
          ),
        ),
      ],
    );
  }
}
