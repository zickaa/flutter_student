import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/students.dart';

class AddStudent extends StatelessWidget {
  static const routeName = "/add-students";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD Student"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              students
                  .addStudent(
                nameController.text,
                ageController.text,
                majorController.text,
              )
                  .then(
                (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Umur"),
                textInputAction: TextInputAction.next,
                controller: ageController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Major"),
                textInputAction: TextInputAction.done,
                controller: majorController,
                onEditingComplete: () {
                  students
                      .addStudent(
                    nameController.text,
                    ageController.text,
                    majorController.text,
                  )
                      .then(
                    (response) {
                      print("Kembali ke Home & kasih notif snack bar");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Berhasil ditambahkan"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    students
                        .addStudent(
                      nameController.text,
                      ageController.text,
                      majorController.text,
                    )
                        .then(
                      (response) {
                        print("Kembali ke Home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
