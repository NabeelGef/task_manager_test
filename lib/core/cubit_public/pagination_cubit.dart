import 'public_notifier.dart';

class PaginationCubit {
  static final PaginationCubit _instance = PaginationCubit();
  static PaginationCubit get instance => _instance;
  PublicNotifierApp publicNotifierApp = PublicNotifierApp();
  bool isLoadingPagination = false;
  int currentPage = 0;
  Future<void> fetchItemsList(Future<void> Function(int current) fetchData , List<dynamic> items) async {
    if (isLoadingPagination) return;
    if (publicNotifierApp.isLoadingPagination.value) return;
    publicNotifierApp.changeLoadingPagination();
    await fetchData(currentPage);
    if (items.isEmpty) {
      isLoadingPagination = true;
      publicNotifierApp.changeLoadingPagination();
      return;
    }
    currentPage+=8;
    publicNotifierApp.changeLoadingPagination();
  }
  onRefresh(Future<void> Function(int current) fetchData) async {
    isLoadingPagination = false;
    currentPage = 0;
    await fetchData(currentPage);
    currentPage+=8;
  }
}