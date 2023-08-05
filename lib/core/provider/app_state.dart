import 'package:monie_point/core/provider/base_provider.dart';
import 'package:monie_point/export.dart';

class AppStateProvider extends BaseModel {
  static AppStateProvider of(BuildContext context) =>
      Provider.of<AppStateProvider>(context, listen: false);
  int _currentTabIndex = 0; // Defaults to chat tab

  int get currentTabIndex => _currentTabIndex;

  void setCurrentTabTo({required int newTabIndex}) {
    _currentTabIndex = newTabIndex;
    notifyListeners();
  }

  void disposeState() {
    _currentTabIndex = 0;
    // super.disposeState();
  }
}
