import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Modifier_patient extends StatefulWidget {
  const Modifier_patient({Key? key}) : super(key: key);
  static const routName = "/Update";
  @override
  State<Modifier_patient> createState() => _Modifier_patientState();
}

class _Modifier_patientState extends State<Modifier_patient> {
  User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    final userData = userDoc.data() as Map<String, dynamic>;

    _nomController.text = userData['name'] as String;

    _emailController.text = userData['email'].toString();
  }

  void _updateUserData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);

      final updatedUserData = {
        'name': _nomController.text,
        'email': _emailController.text,
      };

      await userDoc.update(updatedUserData);

      // Show a success message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Mise à jour des données de l'utilisateur "),
          content: const Text(
              "Les données de l'utilisateur ont été mises à jour avec succès."),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(182, 64, 116, 1),
        centerTitle: true,
        title: const Text('Modifier Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(4.h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomController,
                      cursorColor: Color.fromRGBO(182, 64, 116, 1),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "All Field is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          hintText: "nom",
                          labelText: "Entrer nom",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.person),
                          )),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "All Field is required";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      cursorColor: Color.fromARGB(255, 53, 81, 165),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          hintText: "email",
                          labelText: "Enter email",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.email),
                          )),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Change this value to adjust the border radius
                          ),
                          backgroundColor: Color.fromRGBO(182, 64, 116, 1),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: _updateUserData,
                        child: Text(
                          'حفظ',
                          style: TextStyle(fontSize: 24),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Change this value to adjust the border radius
                        ),
                        backgroundColor: Color(0xFF6F6F6),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'إلغاء',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
