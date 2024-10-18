import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

class AppCustomCountryPicker extends StatelessWidget {
  const AppCustomCountryPicker(
      {super.key, this.onChanged, required this.initialSelection});
  final void Function(CountryCode)? onChanged;
  final String initialSelection;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.w,
      child: CountryCodePicker(
        
        dialogBackgroundColor: Theme.of(context).cardColor,
        backgroundColor: Theme.of(context).cardColor,
        onChanged: onChanged,
        initialSelection: initialSelection,
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,

        closeIcon: Icon(
          Icons.cancel_outlined,
          size: 23.sp,
        ),
        
        dialogSize: Size(220.w, 60.h),
        builder: (country) => CustomCountryCodePicker(countryCode: country!),
      ),
    );
  }
}

class CustomCountryCodePicker extends StatelessWidget {
  final CountryCode countryCode;

  const CustomCountryCodePicker({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(width: 2.w),
          Image.asset(
            countryCode.flagUri!,
            package: 'country_code_picker',
            width: 8.w,
            height: 2.h,
          ),
          SizedBox(width: 2.w),
          Text(
            '${countryCode.dialCode}',
            style: TextStyle(
              fontSize: 15.sp,
            ),
            textDirection: ui.TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
