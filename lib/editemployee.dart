import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editemloyee extends StatefulWidget {
  const Editemloyee({super.key});

  @override
  State<Editemloyee> createState() => _EditemloyeeState();
}

class _EditemloyeeState extends State<Editemloyee> {

  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Edit Employee"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 50, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Edit Employee",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFD9D9D9),
                    boxShadow:  [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],

                  ),
                  child: DropdownButton<String>(
                    value: _selectedOption,
                    hint: Text("Select Name"),
                    items: <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 30),
                      Text("E-Mail", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 30),
                      Text("University", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Text(":", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 30),
                      Text(":", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 30),
                      Text(":", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 160,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 160,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'E-Mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 160,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'University',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/1.jpg", width: 100, height: 100),
                  ),
                ],
              ),
              SizedBox(height: 80),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.purple,
                    shadowColor: Colors.grey,
                    elevation: 20,
                  ),

                  child: Text('Save',style: TextStyle(color: Colors.black),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}