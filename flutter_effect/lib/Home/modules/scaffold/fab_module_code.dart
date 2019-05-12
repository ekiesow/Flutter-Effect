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

      // child Widget of the FAB, usually an Icon
      child: Icon(Icons.send),

      // choose the color of your FAB.
      // Can also use Theme.of(context).buttonColor
      backgroundColor: Colors.blueAccent,

      // onPressed is required. Give your FAB an action.
      onPressed: (){

        // the following shows an alert on the screen
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
         * Usually the FAB will perform an action like allowing the user
         * to share something to another app, navigate to another route (screen),
         * or can even be used to submit a form.
         */

      },
    );
  }
}
