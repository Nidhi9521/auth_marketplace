import 'core/core.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _page = 0;

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    // const HomeScreen(),
    // const AccountScreen(),
    // const CartScreen(),
    // const ProductDetailsScreen()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final appLocale = AppLocalizations.of(context);
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300))),
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomBarButton(icon: Icons.home_outlined, page: 0),
            bottomBarButton(icon: Icons.person_outline_outlined, page: 1),
            bottomBarButton(icon: Icons.shopping_cart_outlined, page: 2),
            bottomBarButton(icon: Icons.production_quantity_limits, page: 3),
          ],
        ),
      ),
    );
  }

  Widget bottomBarButton({required int page, required IconData icon}) {
    return Column(
      children: [
        Container(
          width: bottomBarWidth,
          height: bottomBarBorderWidth,
          decoration: BoxDecoration(
              color: _page == page
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
            updatePage(page);
          },
          icon: Icon(
            icon,
            color: _page == page
                ? GlobalVariables.selectedNavBarColor
                : Colors.black,
            size: 30,
          ),
        ),
      ],
    );
  }
}
