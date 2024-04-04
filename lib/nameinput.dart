import 'package:flutter/material.dart';

class NameInput extends StatefulWidget {
  final Function(String) onNameEntered;

  const NameInput({super.key, required this.onNameEntered});

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final TextEditingController _nameController = TextEditingController();

  Future<void> _saveNameAndNavigate(BuildContext context) async {
    final String name = _nameController.text;

    // Voeg een print-verklaring toe om te controleren of de functie wordt aangeroepen
    print('Name saved: $name');

    widget.onNameEntered(name); // Naam doorgeven aan ouderwidget
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
