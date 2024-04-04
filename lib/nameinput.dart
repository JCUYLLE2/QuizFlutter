import 'package:flutter/material.dart';

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

    if (name.isNotEmpty) {
      widget.onNameEntered(name); // Name passed to parent widget
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Fout"),
          content:
              const Text("Voer alstublieft uw naam in voordat u doorgaat."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveNameAndNavigate(context);
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
