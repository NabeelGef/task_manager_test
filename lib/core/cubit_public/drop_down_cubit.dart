import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownCubit extends Cubit<dynamic>{
  DropDownCubit():super(null);

  dynamic selectedItem;

  void setSelectedItem(dynamic item){
    selectedItem = item;
    emit(item);
  }


}