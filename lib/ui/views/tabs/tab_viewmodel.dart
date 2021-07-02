import 'package:nibble_app/app/locator.dart';
import 'package:nibble_app/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class TabViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  int get currentIndex => _navigationService.currentNavbarIndex;

  void navigateTo(int index) {
    _navigationService.navbarToIndex(index);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_navigationService];
}
