import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextForm',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Form validation'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                MyPic(),
                MyForm(),
              ],
            ),
          )),
    );
  }
}

class MyPic extends StatelessWidget {
  const MyPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/tak.jpg'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
          ),
        ])
      ],
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController studentId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              labelText: 'Enter Name',
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
                return 'Enter Correct Name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: studentId,
            decoration: const InputDecoration(
              labelText: 'Enter Student ID',
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length > 11 ||
                  value.length < 11 ||
                  !RegExp(r'^\d+').hasMatch(value)) {
                return 'Enter Correct Student ID';
              }
              return null;
            },
          ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(labelText: 'Enter Email'),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                return 'Enter Correct Email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(name.text),
                        Text(studentId.text),
                        Text(email.text),
                      ],
                    ));
                  },
                );
              }
            },
            child: const Text('Submit Data'),
          ),
        ],
      ),
    );
  }
}
