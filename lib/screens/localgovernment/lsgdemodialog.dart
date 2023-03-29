import 'package:flutter/material.dart';
class Lsgdd extends StatefulWidget {
  const Lsgdd({Key? key}) : super(key: key);

  @override
  State<Lsgdd> createState() => _LsgddState();
}

class _LsgddState extends State<Lsgdd> {
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
