import 'package:flutter/material.dart';

class DeletedDialog extends StatelessWidget {
  const DeletedDialog({Key? key, required this.delete}) : super(key: key);
  final VoidCallback delete;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deleted User'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Do you want to delete this user ??'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: delete,
          child:  const Text('Delete'),
        ),
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}


