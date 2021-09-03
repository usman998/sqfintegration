import 'package:flutter/material.dart';
import 'package:test_app/secondScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:test_app/models/userModel.dart';
import 'package:test_app/services/userServices.dart';



class MyHomePage extends StatefulWidget {


  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _user = new User();
  var _userServices = UserServices();

  int _counter = 0;
  String name = '';
  String emailAddress = '';
  String password = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10,bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'username',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'username',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (value){
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10,bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'email',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (value){
                setState(() {
                  emailAddress = value;
                });
              },
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10,bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (value){
                setState(() {
                  password = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.black,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: ()async{
                    if(EmailValidator.validate(emailAddress)== false){
                      print('invalid email');
                    }
                    _user.name = nameController.text;
                    _user.email = emailController.text;
                    _user.password = passwordController.text;
                    var result = await _userServices.saveUsers(_user);
                    print(result);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_)=> alertDialog);
  }


}