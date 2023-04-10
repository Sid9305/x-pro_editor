import 'package:Xpro_editor/screens/CreateScreen.dart';
import 'package:Xpro_editor/screens/HelpScreen.dart';
import 'package:Xpro_editor/screens/MeScreen.dart';
import 'package:Xpro_editor/screens/MixScreen.dart';
import 'package:Xpro_editor/screens/NotificationScreen.dart';
import 'package:Xpro_editor/screens/SearchScreen.dart';
import 'package:Xpro_editor/screens/SettingScreen.dart';
import 'package:flutter/material.dart';
import '../components/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedindex = 2;

  static const List<Widget> _screens = <Widget>[
    MixScreen(),
    Search(),
    CreateScreen(),
    MeScreen(),

  ];

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading:
        const Padding(
          padding: EdgeInsets.fromLTRB(18.0,0,0,0),
          child: Image(
            image: AssetImage('assets/PiRO.png'),
            width: 90,
            height: 50,
          ),
        ),
        // const Icon(FontAwesomeIcons.crown),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.tv_sharp)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HelpScreen()));
              },
              icon: const Icon(Icons.help)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
              icon: const Icon(Icons.notifications)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingScreen()));

              },
              icon: const Icon(Icons.settings)
          ),
        ],
        
      ),
      
      
      body: _screens.elementAt(_selectedindex),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(250,20, 21, 24),
          icon: Icon(Icons.dashboard_customize),
          label: 'Mix',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(250,20, 21, 24),
          icon: Icon(Icons.search),
          label: 'Search',
        ),BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(250,20, 21, 24),
          icon: Icon(Icons.add_circle),
          label: 'Create',
        ), BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(250,20, 21, 24),
              icon: Icon(Icons.person),
              label: 'Me',
            ),
      ],
        currentIndex: _selectedindex,
        onTap: _onItemTapped,

      ),
    );
  }
}
