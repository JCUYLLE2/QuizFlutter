import 'package:flutter/material.dart';
import 'package:flutter_quizz/quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameInput extends StatefulWidget {
  final Function(String) onNameEntered;

  const NameInput({Key? key, required this.onNameEntered}) : super(key: key);

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final TextEditingController _nameController = TextEditingController();

  Future<void> _saveNameAndNavigate(BuildContext context) async {
    final String name = _nameController.text;
    widget.onNameEntered(name); // Naam doorgeven aan ouderwidget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveNameAndNavigate(context);
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
