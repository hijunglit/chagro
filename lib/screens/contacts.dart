import 'package:flutter/cupertino.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key, required this.listId});

  final int listId;

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: Center(child: Text('List of contacts will go here')),
    );
  }
}
