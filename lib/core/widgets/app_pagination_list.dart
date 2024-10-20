import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colorsapp.dart';
import '../cubit_public/pagination_cubit.dart';

class AppCustomPaginationList<T> extends StatefulWidget {
  const AppCustomPaginationList(
      {super.key,
      required this.items,
      required this.itemWidget,
      required this.paginatedItems,
      required this.fetchItemsList,
      this.loadingWidget
      });
  final List<Widget> itemWidget;
  final List<T> items;
  final List<T> paginatedItems;
  final Widget? loadingWidget;
  final Future<void> Function(int currentPage) fetchItemsList;

  @override
  State<AppCustomPaginationList> createState() =>
      _AppCustomPaginationListState<T>();
}

class _AppCustomPaginationListState<T> extends State<AppCustomPaginationList> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        PaginationCubit.instance
            .fetchItemsList(widget.fetchItemsList, widget.paginatedItems);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index != widget.items.length
              ? widget.itemWidget[index]
              : _buildProgressIndicator();
        },
        separatorBuilder: (context, index) => SizedBox(height: 20.sp),
        itemCount: widget.items.length + 1);
  }

  Widget _buildProgressIndicator() {
    return ValueListenableBuilder<bool>(
      valueListenable:
          PaginationCubit.instance.publicNotifierApp.isLoadingPagination,
      builder: (context, value, child) => value
          ?  widget.loadingWidget?? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Opacity(
                  opacity: 1.0,
                  child: CircularProgressIndicator(
                    color: kColorMain,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
