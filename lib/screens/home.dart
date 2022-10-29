import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Material App Bar $currentPage'),
      ),
      // body:
          // TODO para navegar Basico
          // currentPage == 2
          //     ? CustomScreen(color: Colors.pink)
          //     : currentPage == 1
          //         ? CustomScreen(color: Colors.green)
          //         : CustomScreen(color: Colors.red),

      body: PageView(
        controller: pageController,
        // physics: BouncingScrollPhysics(),
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomScreen(
            color: Colors.green,
          ),
          CustomScreen(
            color: Colors.yellowAccent,
          ),
          CustomScreen(
            color: Colors.red,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;

          pageController.animateToPage(
            currentPage,
            duration: Duration(seconds: 3),
            curve: Curves.decelerate,
          );
          setState(() {});
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white.withOpacity(1),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.white,
            ),
            label: 'Gift',
          )
        ],
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: const Center(
        child: Text('Pagina'),
      ),
    );
  }
}
