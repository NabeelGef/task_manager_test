import 'package:flutter/material.dart';

class PublicNotifierApp {
  final ValueNotifier<bool> isLoadingPagination = ValueNotifier<bool>(false);

  changeLoadingPagination() {
    isLoadingPagination.value = !isLoadingPagination.value;
  }
}
