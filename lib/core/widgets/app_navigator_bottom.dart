import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constant/colorsapp.dart';
import '../cubit_public/check_internet_cubit.dart';
import '../cubit_public/navigator_bottom_cubit.dart';
import 'app_text.dart';

class AppNavigatorBottom extends StatefulWidget {
  const AppNavigatorBottom({super.key});

  @override
  State<AppNavigatorBottom> createState() => _AppNavigatorBottomState();
}

class _AppNavigatorBottomState extends State<AppNavigatorBottom> {
  double mainHeight = 56.px;
  double height = 0.px;
  Color color = Colors.green;
  String text = "OnLine";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorBottomCubit, int>(builder: (context, state) {
      return BlocConsumer<CheckInternetCubit, bool>(
        listener: (context, statee) async {
          if (statee == true) {
            text = "OnLine";
            color = kColorGreen;
            await Future.delayed(const Duration(seconds: 2));
            setState(() {
              mainHeight = 56.px;
              height = 0;
            });
          } else {
            text = "OffLine";
            color = kColorBlack;
            mainHeight = 86.px;
            height = 30.px;
          }
        },
        builder: (context, statebool) {
          return AnimatedContainer(
            height: mainHeight,
            duration: const Duration(seconds: 1),
            child: Column(
              children: [
                BottomNavigationBar(
                    elevation: 1,
                    currentIndex: state,
                    onTap: (index) {
                    
                      BlocProvider.of<NavigatorBottomCubit>(context)
                          .navigateTo(index);
                      context.pushReplacement(
                          BlocProvider.of<NavigatorBottomCubit>(context)
                              .pageList[index]);
                 
                      
                      
                   
                    },
                    backgroundColor: kColorWhite,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: kColorMain,
                    unselectedItemColor: kColorPlaceholder,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 10.px,
                    ),
                    selectedLabelStyle: TextStyle(
                      fontSize: 10.px,
                    ),
                    items: const [
                      BottomNavigationBarItem(
                          label: "home",
                          icon: Icon(Icons.home_filled)),
                    ]),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  alignment: Alignment.center,
                  height: height,
                  width: double.infinity,
                  color: color,
                  child: AppCustomText(
                    text: text,
                    colorText: kColorWhite,
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
