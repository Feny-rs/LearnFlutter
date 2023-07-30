import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalkulator/screen/fitur_auth/sign_in.dart';
import 'package:kalkulator/screen/fitur_calculator/calculator.dart';
import 'ui/item_menu.dart';
import 'package:math_expressions/math_expressions.dart';
import 'ui/buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //Array of button
  final List<String> menus = [
    'Calculator',
    'Authentication',
    'RecyclerView',
    'Slider',
    'Pokemon',
    'About Me'
  ];

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column (
        children: <Widget>[
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: menus.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                //menu calculator
                if(index == 0){
                  return ItemMenu(
                    menuText: menus[index],
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    menutapped: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Calculator()),
                        );
                      },
                  );
                }

                //menu authentication
                else if(index == 1){
                  return ItemMenu(
                    menuText: menus[index],
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    menutapped: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MySignIn()),
                      );
                    },
                  );
                }

                //menu recyclerview
                else if(index == 2){
                  return ItemMenu(
                    menuText: menus[index],
                    color: Colors.green,
                    textColor: Colors.white,
                    menutapped: (){
                      _showToast(context);
                      },
                  );
                }

                //menu Slider
                else if(index == 3){
                  return ItemMenu(
                    menuText: menus[index],
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    menutapped: (){
                      _showToast(context);
                    },
                  );
                }

                //End menu
                else {
                  return ItemMenu(
                    menuText: menus[index],
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    menutapped: (){
                      _showToast(context);
                    },
                  );
                }
              }),
          ),
        ],
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: const Text('Comming soon'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}