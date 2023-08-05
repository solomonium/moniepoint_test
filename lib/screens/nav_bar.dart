import 'package:monie_point/core/provider/provider.dart';
import 'package:monie_point/export.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  MyStatefulWidgetState createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<BottomNavigation> {
  // final Authentication _authentication = locator<Authentication>();
  // final NavigationService navigationService = locator<NavigationService>();

  final bool isSelected = true;
  Widget getViewForIndex(int index) {
    if (kDebugMode) {
      print(index);
    }
    switch (index) {
      case 0:
        return const MyHomePage();
      case 1:
        return const Calculate();
      case 2:
        return const Shipment();
      case 3:
        return const Profile();
      default:
        return const MyHomePage();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: MoniePointTestColors.background,
        body: getViewForIndex(model.currentTabIndex),
        bottomNavigationBar: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 80,
              child: BottomNavigationBar(
                selectedFontSize: 12,
                unselectedFontSize: 10,
                // iconSize: 15,
                type: BottomNavigationBarType.fixed,
                onTap: (newTab) {
                  // print(newTab);
                  model.setCurrentTabTo(newTabIndex: newTab);
                },
                currentIndex: model.currentTabIndex,

                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        Image.asset(
                          "assets/icons/home.png",
                          width: 23.0,
                          color: model.currentTabIndex == 0
                              ? MoniePointTestColors.primary
                              : Colors.grey,
                        ),
                      ],
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.calculate_outlined,
                      color: model.currentTabIndex == 1
                          ? MoniePointTestColors.primary
                          : Colors.grey,
                    ),
                    label: 'Calculate',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.access_time_outlined,
                      color: model.currentTabIndex == 2
                          ? MoniePointTestColors.primary
                          : Colors.grey,
                    ),
                    label: 'Shipments',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: model.currentTabIndex == 3
                          ? MoniePointTestColors.primary
                          : Colors.grey,
                    ),
                    //   ],
                    // ),
                    label: 'Profile',
                  ),
                ],
                selectedItemColor: MoniePointTestColors.primary,
              ),
            ),
            // Positioned(
            //     bottom:
            //         70, // Adjust this value to position the container above the selected tab
            //     left: 0,
            //     right: 0,
            //     child: Container(
            //       height: 10,
            //       width: 23,
            //       padding: const EdgeInsets.symmetric(horizontal: 12),
            //       decoration: BoxDecoration(
            //         color: model.currentTabIndex == 1
            //             ? MoniePointTestColors.primary
            //             : Colors.transparent,
            //         // borderRadius: BorderRadius.circular(15),
            //       ),
            //     ))
          ],
        ),
      );
    });
  }
}
