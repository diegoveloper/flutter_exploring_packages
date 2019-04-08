import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SampleKeyboardActions extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Keyboard Actions"),
      ),
      body: FormKeyboardActions(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL, //optional
        keyboardBarColor: Colors.grey[200], //optional
        nextFocus: true, //optional
        actions: [
          KeyboardAction(
            focusNode: _nodeText1,
          ),
          KeyboardAction(
            focusNode: _nodeText2,
            closeWidget: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.close),
            ),
          ),
          KeyboardAction(
            focusNode: _nodeText3,
            onTapAction: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Custom Action"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    );
                  });
            },
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _nodeText1,
                  decoration: InputDecoration(
                    hintText: "Input Number",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  focusNode: _nodeText2,
                  decoration: InputDecoration(
                    hintText: "Input Text with Custom Close Widget",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _nodeText3,
                  decoration: InputDecoration(
                    hintText: "Input Number with Custom Action",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
