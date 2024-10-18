import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../cubit_public/drop_down_cubit.dart';
import 'app_text.dart';

class AppDropDown<T> extends StatefulWidget {
  final String title;
  final String? appTitle;
  final String? value;
  final List<String> items;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final Color? fillColor;
  final Color? titleColor;
  final double? titleSize;
  final Color? dropDownColor;
  final FormFieldValidator<dynamic>? validator;
  final Color? dropDownItemColor;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icon;
  final Color? iconColor;
  final bool isDivider;
  final bool isBold;
  final void Function(dynamic)? getValue;
  final String Function(dynamic) getItemValue;
  final void Function(dynamic)? onChanged;
  final void Function(dynamic)? onSaved;
  const AppDropDown(
      {super.key,
      this.width,
      required this.title,
      required this.items,
      required this.getItemValue,
      this.validator,
      this.contentPadding,
      this.padding,
      this.icon,
      this.iconColor,
      required this.value,
      this.isDivider = false,
      this.getValue,
      this.titleSize,
      this.prefixIcon,
      this.suffixIcon,
      this.dropDownColor,
      this.borderRadius,
      this.titleColor,
      this.borderColor,
      this.dropDownItemColor,
      this.fillColor,
      this.isBold = false,
      this.height,
      this.appTitle,
      required this.onChanged,
      this.onSaved});
  @override
  AppDropDownState createState() => AppDropDownState<T>();
}

class AppDropDownState<T> extends State<AppDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownCubit, dynamic>(builder: (context, state) {
      return Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Column(
          children: [
            widget.appTitle != null
                ? Row(
                    children: [
                      SizedBox(
                        width: 15.sp,
                      ),
                      AppCustomText(
                        text: widget.appTitle!,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height: 10.sp,
            ),
            Container(
             
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(15.sp),
              ),
              height: widget.height,
              width: widget.width,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<dynamic>(
                  decoration: InputDecoration(
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
                    enabled: false,
                    filled: true,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                    contentPadding: widget.contentPadding,
                    fillColor: widget.fillColor ??
                        Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  isDense: true,
                  isExpanded: true,
                  validator: widget.validator,
                  hint: AppCustomText(
                    text: widget.title,
                    colorText: widget.titleColor,
                    fontWeight: widget.isBold ? FontWeight.bold : null,
                    fontSize: widget.titleSize ?? 17.sp,
                  ),
                  padding: widget.padding,
                  dropdownColor: widget.dropDownColor,
                  value: widget.value,
                  style: TextStyle(
                      color: widget.titleColor,
                      fontSize: widget.titleSize,
                      overflow: TextOverflow.visible),
                  icon: widget.icon ?? const SizedBox.shrink(),
                  // ?? Icon(Icons.keyboard_arrow_down_sharp , color: widget.iconColor?? AppColors.white,),
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved

                  /*   (newValue) {

                    final T? selectedObject = widget.items.firstOrNull!(
                            (item) => widget.getItemValue(item) == newValue,
                      );
                      if(widget.getValue!=null) {
                        if(selectedObject!=null){
                          widget.getValue!(selectedObject);
                        }
                      }
                    BlocProvider.of<DropDownCubit>(context)
                        .setSelectedItem(newValue);
                    if (widget.getValue != null) {
                      widget.getValue!(newValue);
                    }
                  },*/
                  ,
                  selectedItemBuilder: (context) {
                    return widget.items.map<Widget>((value) {
                      return AppCustomText(
                        text: widget.getItemValue(value),
                        colorText: widget.dropDownItemColor ??
                            Theme.of(context).textTheme.labelMedium!.color,
                        fontSize: widget.titleSize ?? 17.sp,
                      );
                    }).toList();
                  },
                  items: widget.items.map((e) {
                    return DropdownMenuItem(
                        value: e,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppCustomText(
                              text: e,
                              colorText: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .color,
                            ),
                            widget.isDivider
                                ? const Divider()
                                : const SizedBox.shrink()
                          ],
                        ));
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
