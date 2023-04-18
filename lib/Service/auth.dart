import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // Login function
  static Future signIn(
      BuildContext context, String email, String password) async {
    String? erreur;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      route(context);
    } on FirebaseAuthException catch (e) {
      // Close the loading indicator dialog
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        erreur = 'Aucun utilisateur trouvé pour cet email.';
      } else if (e.code == 'wrong-password') {
        erreur = 'Mot de passe erroné fourni pour cet utilisateur.';
      }
      showErrorDialog(context, 'Sign up error', erreur.toString());
    }
  }

  static void showErrorDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // route to admin or patient
  static route(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Admin") {
          Navigator.pushNamed(context, "/Dashboard");
        } else {
          Navigator.pushNamed(context, "/NavigationClient");
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  // Registre function
  static signUp(
      String email, String password, String name, BuildContext context) async {
    String? erreur;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(email, name, password, context),
              });
      // .catchError((e) {
      //   print(e);
      // });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        // Handle the error by returning an error message
        erreur = 'Email déjà utilisée par un autre compte.';
      } else {
        // Handle other errors
        erreur = 'An error occurred while signing up.';
      }
      showErrorDialog(context, 'Sign up error', erreur.toString());
    }
  }

  static postDetailsToFirestore(
      String email, String name, String password, BuildContext context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': email,
      'name': name,
      'rool': 'client',
    });
    Navigator.pushNamed(context, "/NavigationClient");
  }

  // logout
  static logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, "/Home");
  }
}
