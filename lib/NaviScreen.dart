import 'package:flutter/material.dart';

class NaviScreen extends StatefulWidget {
  const NaviScreen({Key? key}) : super(key: key);

  @override
  _NaviScreenState createState() => _NaviScreenState();
}
class _NaviScreenState extends State<NaviScreen> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle  buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/office': (context) => const SecondScreen(),
        '/settings': (context) => const TScreen(),
      },
    );
  }
}

Widget navDrawer (context) => Drawer(
  child: ListView (padding: EdgeInsets.zero,children: [
    DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
      child: Container(
        height: 200,
        child: const Text ("Демо навигации"),
      ),
    ),
    ListTile(
      leading: const Icon (Icons.one_k),
      title: const Text('Главная'),
      onTap: (){
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/');
      },
    ),
    ListTile(
      leading: const Icon (Icons.two_k),
      title: const Text('Личный кабинет'),
      onTap: (){
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/office');
      },
    ),
    const Divider(),
    ListTile(
      leading: const Icon (Icons.three_k),
      title: const Text('Настройки'),
      onTap: (){
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/settings');
      },
    ),
  ],),
);

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle  buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      appBar: AppBar(title: const Text('Главная'),
        actions: <Widget>[
          IconButton(
              tooltip: "Мой банк", //всплывающая подсказка
              onPressed: () {}, icon: Icon (Icons.account_balance)),
          IconButton(
              tooltip: "Настройки",
              onPressed: () {}, icon: Icon (Icons.settings)),
          TextButton(
            onPressed: () {},
            child: Text("Бонусы"),
            style: buttonStyle,
          ),
        ],
      ),
      drawer: navDrawer(context),
      body: const Center(
        child: Text('Главная страница'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Личный кабинет'),),
      drawer: navDrawer(context),
      body: const Center(
        child: Text('Личный кабинет'),
      ),
    );
  }
}

class TScreen extends StatelessWidget {
  const TScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки'),),
      drawer: navDrawer(context),
      body: const Center(
        child: Text('Настройки'),
      ),
    );
  }
}
