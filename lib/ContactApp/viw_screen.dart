import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/ContactApp/contact_deails.dart';
import 'package:state_management/ContactApp/contact_model.dart';
// import 'package:state_management/ContactApp/edit_contact_list.dart';
import 'package:state_management/ContactApp/provider.dart';

class ViewScreen extends ConsumerStatefulWidget {
  const ViewScreen({super.key});

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends ConsumerState<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    final cpro = ref.watch(cprovaider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Contact App"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final contacts = cpro[index];
            return ListTile(
              title: Text(contacts.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contacts.phonNumber,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    contacts.email,
                    style: const TextStyle(fontSize: 10, color: Colors.green),
                  )
                ],
              ),
              trailing: Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        editContact(contacts);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(cprovaider.notifier).state = List.from(cpro)
                          ..remove(contacts);
                      },
                    ),
                  ],
                ),
              ),
              onTap: () {},
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 45,
                ),
              ),
            );
          },
          itemCount: cpro.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddContactScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void editContact(Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController =
            TextEditingController(text: contact.name);
        TextEditingController phoneNumberController =
            TextEditingController(text: contact.phonNumber);
        TextEditingController emailCon =
            TextEditingController(text: contact.email);

        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: emailCon,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  contact.name = nameController.text;
                  contact.phonNumber = phoneNumberController.text;
                  contact.email = emailCon.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
