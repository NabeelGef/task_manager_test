import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/colorsapp.dart';
import 'app_text.dart';
import 'country_picker.dart';

class AppCustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;

  final String? lable;
  final Widget? icon;
  final int? maxLength;
  final int? maxLines;
  final bool isPass;
  final bool isPhone;
  final bool isfilled;
  final Color? passIconColor;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? labelWidget;
  final EdgeInsets? padding;
  final bool readOnly;
  final Color? colorHint;
  final Color? colorLable;
  final Color? fillColor;
  final Color? textColor;
  final double? fontSize;
  final double? hintfontSize;
  final FontWeight? hintFontWeight;
  final void Function(String)? onChanged;
  final String? title;
  final double? titleSize;
  final FontWeight? titleBold;
  final EdgeInsets? contentPadding;
  final bool isRequired;
  final void Function(CountryCode)? onCountryCodeChanged;
  final String? initialSelection;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;

  const AppCustomTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.lable,
    this.icon,
    this.keyboardType,
    this.isPass = false,
    this.passIconColor,
    this.validator,
    this.borderRadius,
    this.borderColor,
    this.padding,
    this.prefixIcon,
    this.readOnly = false,
    this.onChanged,
    this.title,
    this.titleSize,
    this.titleBold,
    this.colorHint,
    this.hintFontWeight,
    this.textColor,
    this.colorLable,
    this.fillColor,
    this.contentPadding,
    this.isRequired = true,
    this.isfilled = true,
    this.fontSize,
    this.hintfontSize,
    this.labelWidget,
    this.isPhone = false,
    this.onCountryCodeChanged,
    this.onTap,
    this.maxLength,
    this.maxLines,
    this.initialSelection,
    this.onFieldSubmitted,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppCustomTextFormField> {
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.title != null
              ? Row(
                  children: [
                    SizedBox(
                      width: 10.sp,
                    ),
                    AppCustomText(
                      text: widget.title!,
                     
                          fontSize: widget.titleSize ?? 15.sp,
                          fontWeight: widget.titleBold,
                         
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            decoration: const BoxDecoration(),
            child: TextFormField(
              textAlign: widget.isPhone && context.locale.languageCode == "ar"
                  ? TextAlign.end
                  : TextAlign.start,
              inputFormatters: widget.maxLength != null
                  ? [LengthLimitingTextInputFormatter(widget.maxLength)]
                  : null,
                  
              maxLines: widget.maxLines,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              style: TextStyle(
                  fontSize: widget.fontSize ?? 16.sp,
                  color: widget.textColor ??
                      Theme.of(context).textTheme.labelMedium!.color,
                  fontWeight: FontWeight.normal,
                 
                  fontFamily: "Changa"),

              readOnly: widget.readOnly,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                label: widget.labelWidget,
                filled: widget.isfilled,
                hintStyle: TextStyle(color: widget.colorHint),
                // hintTextDirection: TextDirection.ltr,
                disabledBorder: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent)),
                border: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent)),
                fillColor: widget.fillColor ??
                    Theme.of(context).inputDecorationTheme.fillColor,
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(vertical: 12, horizontal: 4.w),
                labelText: widget.lable,
                labelStyle:
                    TextStyle(color: widget.colorLable, fontFamily: "Changa"),
                hintText: widget.hint?.tr(),
                prefixIcon:
                    widget.isPhone && context.locale.languageCode != "ar"
                    ? SizedBox(
                        width: 22.w,
                        child: AppCustomCountryPicker(
                            initialSelection: widget.initialSelection ?? "QA",
                            onChanged: widget.onCountryCodeChanged),
                      )
                    : widget.prefixIcon,
                suffixIcon:
                    widget.isPhone && context.locale.languageCode == "ar"
                    ? SizedBox(
                        width: 22.w,
                        child: AppCustomCountryPicker(
                            initialSelection: widget.initialSelection ?? "QA",
                            onChanged: widget.onCountryCodeChanged),
                      )
                        : widget.icon ??
                    (widget.isPass
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _hide = !_hide;
                              });
                            },
                            icon: _hide
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    size: 20.sp,
                                    color: widget.passIconColor ??
                                        kColorPlaceholder,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    size: 20.sp,
                                    color: widget.passIconColor ??
                                        kColorPlaceholder,
                                  ),
                          )
                        : null),
                isDense: true,
              ),
              obscureText: widget.isPass && _hide,
              keyboardType: widget.keyboardType,
              onFieldSubmitted: widget.onFieldSubmitted,
              // focusNode: FocusNode(),
            ),
          ),
          widget.title != null
              ? SizedBox(height: 2.5.w)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
