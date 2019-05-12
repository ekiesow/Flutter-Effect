import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget floatingActionButton(){
    return FloatingActionButton(

      // The child Widget of the FAB is usually an Icon.
      child: Icon(Icons.send),

      // You can choose the color of your FAB.
      backgroundColor: Colors.blueAccent,
      /*
       * You may also use Theme.of(context).buttonColor
       * if main returns MaterialApp with
       * theme: ThemeData(
       *  primarySwatch: Colors.myColorChoice
       *  or
       *  primaryColor: Colors.myColorChoice
       * )
       */

      // onPressed is required. Give your FAB an action.
      onPressed: (){

        // The following shows an alert on the screen.
        return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text("Message Sent!",
                  textAlign: TextAlign.center,
                ),
              );
            }
        );

        /*
         * Most often, the FAB will perform an action like allowing the user
         * to share something to another app, navigate to another route (screen),
         * or can even be used to submit a form.
         */

      },
    );
  }
}
