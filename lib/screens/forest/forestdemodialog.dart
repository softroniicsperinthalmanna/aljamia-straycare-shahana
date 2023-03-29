import 'package:flutter/material.dart';
class Forestdd extends StatefulWidget {
  const Forestdd({Key? key}) : super(key: key);

  @override
  State<Forestdd> createState() => _ForestddState();
}

class _ForestddState extends State<Forestdd> {
  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog( // <-- SEE HERE
            title: const Text('Select Booking Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('General'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Silver'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Gold'),
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
// --- Button Widget --- //
      Center(
        child: ElevatedButton(
          onPressed: _showSimpleDialog,
          child: const Text(
            'Show Simple Dialog',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
