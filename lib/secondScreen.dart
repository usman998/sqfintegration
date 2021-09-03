import 'package:flutter/material.dart';




class SecondScreen extends StatelessWidget {
  // const SecondScreen({Key? key}) : super(key: key);
  SecondScreen({required this.email, required this.name});

  final String name ;
  final String email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Text(email, style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}








//
// class SecondScreen extends StatefulWidget {
//   var name;
//
//   var emaili;
//
//   // const SecondScreen({Key? key}) : super(key: key);
//   // SecondScreen({required this.name, required this.emaili})
//
//
//   @override
//   _SecondScreenState createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//   SecondScreen({required this.name, required this.emaili})
//
//   final String name;
//   final String email;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(name),
//           Text(email)
//         ],
//       ),
//     );
//   }
// }


