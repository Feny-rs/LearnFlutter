import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MySignIn extends StatefulWidget {
  const MySignIn({Key? key}) : super(key: key);

  @override
  State<MySignIn> createState() => _MySignIn();
}

class _MySignIn extends State<MySignIn> {

  final Color _backgroundPrimary = HexColor("#aec045");
  final Color _accents = HexColor("#3b4c51");
  final Color _text = HexColor("#95a3aa");

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text("Welcome back!", style: TextStyle(
              fontWeight: FontWeight.w500,
              color: _backgroundPrimary,
              fontSize: 30
            )
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
              child: const Text('Sign In'),
              onPressed: (){
                print(username.text);
                print(password.text);
              },
            )
          ),
          TextButton(onPressed: (){
            _showToast(context);
          }, child: const Text('Does not have account?'))
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