import 'package:flutter/material.dart';

void main() {
  runApp(const TextField_App());
}

class TextField_App extends StatefulWidget {
  const TextField_App({super.key});

  @override
  State<TextField_App> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextField_App> {
  TextEditingController nameController = TextEditingController();

  String? myName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "TextField Demo",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                style: const TextStyle(
                  fontSize: 30,
                ),
                obscureText: true,
                // Whether to hide the text being edited (e.g., for passwords).
                //When this is set to true, all the characters in the text field are replaced by [obscuringCharacter],
                //and the text in the field cannot be copied with copy or cut.
                //If [readOnly] is also true, then the text cannot be selected.
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility),
                  hintText: "Enter Name",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val) {
                  print("Value : $val");
                },
                onEditingComplete: () {
                  print("Editing Completed");
                },
                onSubmitted: (value) {
                  print("Value Submitted : $value");
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print("Add Data");
                myName = nameController.text;
                print("My Name :$myName");
                nameController.clear();
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Add Data",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Name : $myName",
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
