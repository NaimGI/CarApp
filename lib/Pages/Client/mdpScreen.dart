import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/submitForm.dart';

class mdpScreen extends StatefulWidget {
  const mdpScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = "/mdp";

  @override
  State<mdpScreen> createState() => _mdpScreenState();
}

class _mdpScreenState extends State<mdpScreen> {
  var _isloading = false;
  final user = FirebaseAuth.instance.currentUser;
  void _submitForm(String actuel, String nouveau, String confirmer) async {
    setState(() {
      _isloading = true;
    });
    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: user!.email as String, password: actuel);

      var message = "Mot de passe mis à jour avec succès";
      await user!.reauthenticateWithCredential(credential);
      await user!.updatePassword(nouveau);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.withOpacity(0.8),
      ));
      setState(() {
        _isloading = false;
      });
      Navigator.of(context).pop();
    } on PlatformException catch (_) {
      setState(() {
        _isloading = false;
      });
      var message = "Une erreur s'est produite";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Color.fromARGB(255, 175, 76, 76),
      ));
    } catch (e) {
      _isloading = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("sécurité"),
        backgroundColor: Color.fromRGBO(182, 64, 116, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FormEditPassword(
            submitFn: _submitForm,
            isLoading: _isloading,
          ),
        ),
      ),
    );
  }
}
