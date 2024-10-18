import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant/approuter.dart';

class NavigatorBottomCubit extends Cubit<int> {
  NavigatorBottomCubit() : super(0);
  int selectedButton = 0;
  List<String> pageList = [
    AppRouter.tasksScreen,
  ];
  void navigateTo(int index) {
    selectedButton = index;

    emit(selectedButton); // Update the current index state
  }
}
