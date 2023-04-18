import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FormEditPassword extends StatefulWidget {
  final void Function(
    String actuel,
    String newMdp,
    String confnew,
  ) submitFn;
  final isLoading;
  const FormEditPassword({
    Key? key,
    required this.submitFn,
    this.isLoading,
  }) : super(key: key);

  @override
  State<FormEditPassword> createState() => _FormEditPasswordState();
}

class _FormEditPasswordState extends State<FormEditPassword> {
  final _formKey = GlobalKey<FormState>();
  var _actMdp = '';
  var _newMdp = '';
  var _confMdp = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_actMdp, _newMdp, _confMdp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 70.h,
          padding: EdgeInsets.all(4.h),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      key: ValueKey('ac'),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'mot de passe actuel',
                        prefixIcon: Icon(
                          Icons.lock_open,
                          size: 20.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "vous devez entrer l'actuel";
                        }
                        return null;
                      },
                      onChanged: (newValue) {
                        _actMdp = newValue;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      key: ValueKey('nv'),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'nouveau mot de passe',
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          size: 20.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer un nouveau mot de passe";
                        } else if (value == _actMdp)
                          return "Le nouveau mot de passe doit être différent de l'actuel";

                        return null;
                      },
                      onChanged: (value) => _newMdp = value,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      key: ValueKey('cnv'),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Confirmer',
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          size: 20.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Vous devez mettre le même mot de passe deux fois pour le confirmer";
                        } else if (value != _newMdp)
                          return "Vous devez mettre le même mot de passe deux fois pour le confirmer";
                        return null;
                      },
                      onSaved: (newValue) {
                        _confMdp = newValue!;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Change this value to adjust the border radius
                        ),
                        backgroundColor: Color.fromRGBO(81, 191, 114, 1),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: _trySubmit,
                      child: widget.isLoading == false
                          ? Text(
                              'Enregistrer',
                              style: TextStyle(fontSize: 24),
                            )
                          : CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
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
                        'Annuler',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ]))),
    );
  }
}
