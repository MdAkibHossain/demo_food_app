import '/models/meal.dart';
import 'package:flutter/material.dart';
import '/screen/categories_screen.dart';
import '/screen/favorites_screen.dart';
import '/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoriteMeal}) : super(key: key);
  final List<Meal> favoriteMeal;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;

  int selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      const CategoriesSareen(),
      FavoritesScreen(
        widget.favoriteMeal,
      ),
    ];

    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectPageIndex == 0 ? 'Category' : 'Your Favorites',
          ),
        ),
        drawer: const MainDrawer(),
        body: _pages[selectPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: selectPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Fevorite',
            ),
          ],
        ));
  }

/////// Tab bar on top/

  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Meal'),
  //         bottom: const TabBar(
  //           tabs: [
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Category',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.star),
  //               text: 'Fevorites',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body:
  //       const TabBarView(
  //         children: [
  //           CategoriesSareen(),
  //           FevoritesScreen(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
