import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/ContactApp/contact_model.dart';
import 'package:state_management/ContactApp/provider.dart';

class AddContactScreen extends ConsumerWidget {
  AddContactScreen({super.key});
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contacts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                  controller: _nameCon,
                  decoration: const InputDecoration(
                      labelText: "Name", hintText: "Name"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nmae required";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: phoneCon,
                  decoration: const InputDecoration(
                      labelText: "PhoneNumber", hintText: "PhoneNumber"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Phone Number required";
                    } else if (value.toString().length <= 9) {
                      return "The minimum caracter is 10";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: emailCon,
                  decoration: const InputDecoration(
                      labelText: "Email", hintText: "Email"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-z]+\.[a-z]+$')
                        .hasMatch(value)) {
                      return 'Email not valid';
                    }

                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!_formkey.currentState!.validate()) {
                      return;
                    }

                    final newContact = Contact(
                        name: _nameCon.text,
                        phonNumber: phoneCon.text,
                        email: emailCon.text);
                    ref.read(cprovaider.notifier).state = [
                      ...ref.read(cprovaider.notifier).state,
                      newContact,
                    ];

                    // _nameCon.clear();
                    // phoneCon.clear();
                    // emailCon.clear();

                    Navigator.pop(context);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
