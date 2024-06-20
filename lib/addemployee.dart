import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purple,
      ),
      body:Padding(
        padding: EdgeInsets.only(left:20,top: 50,right: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Add Employee",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),)),
              SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E mail',
                ),),
              SizedBox(height: 10,),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'University',
                ),),
              SizedBox(height: 10,),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),),
              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                      shadowColor: Colors.grey,
                      elevation: 20// Background color
                  ),
                  child: Text('Add Image',style: TextStyle(color: Colors.black),),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "ViewEmployee");},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shadowColor: Colors.grey,
                    elevation: 20,
                  ),

                  child: Text('Add',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],

          ),
        ),
      ),

    );
  }
}