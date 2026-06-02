import 'package:chagro/screens/contacts.dart';
import 'package:flutter/cupertino.dart';

class ContactGroupsPage extends StatelessWidget {
  const ContactGroupsPage({
    super.key,
    required this.selectedListId,
    required this.onListSelected,
  });

  final int selectedListId;
  final void Function(int) onListSelected;

  @override
  Widget build(BuildContext context) {
    return _ContactGroupsView(
      selectedListId: selectedListId,
      onListSelected: (list) => onListSelected(list.id),
    );
  }
}
