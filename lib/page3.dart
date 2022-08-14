import 'dart:convert';
import 'package:flutter/material.dart';
//import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';


class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  String _ady = "", _telNomeri = "", _emaili = "", _haty = "", checked ="";
  bool awtoKontrol = false;
  final formKey = GlobalKey<FormState>();
  late FocusNode _fNode;
  int maxLin = 1;
  final TextEditingController _nameControl = TextEditingController();
  final TextEditingController _telControl = TextEditingController();
  final TextEditingController _poctaControl = TextEditingController();
  final TextEditingController _hatControl = TextEditingController();


  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();

    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          maxLin = 3;
        } else {
          maxLin = 1;
        }
      });
    });

  }

  @override
  void dispose() {
    _fNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 82, 212),
          title: Text(
              "Yüz tutmak"
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2 + 50,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //ady
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: _nameControl,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            labelText: "Adyňyz",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:  Color.fromARGB(255, 6, 82, 212),
                            ),
                          ),
                          onSaved: (data) => _ady = data!,
                        ),
                      ),

                      //Telefon belgi

                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 8),
                        child: TextFormField(
                          controller: _telControl,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          maxLength: 8,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 7, top: 5),
                            prefixText: "+993",
                            prefixStyle:
                            TextStyle(fontSize: 14, color: Colors.black),
                            labelText: "Telefon belgiňiz",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                          /**validator*/
                          validator: (String? girizlenNomer) {
                            if (girizlenNomer!.length < 8) {
                              return "Nomerinizi yazyn.";
                            }
                          },
                          onSaved: (data) => _telNomeri = data!,
                        ),
                      ),

                      // Elektron poctanyz
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: TextFormField(
                          controller: _poctaControl,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            labelText: "Elektron poçtaňyz",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:  Color.fromARGB(255, 6, 82, 212),
                            ),
                          ),
                          onSaved: (data) => _emaili = data!,
                        ),
                      ),

                      //hatynyz

                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: TextFormField(
                          controller: _hatControl,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          focusNode: _fNode,
                          maxLines: maxLin,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            labelText: "Hatyňyz",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:  Color.fromARGB(255, 6, 82, 212),
                            ),
                          ),
                          onSaved: (data) => _haty = data!,
                        ),
                      ),
                    ],
                  ),
                ),

                //button ugrat
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            _girizilenDatanyBarla(context);
                          },
                          child: Text(
                            "Ugrat",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          textColor: Color.fromRGBO(250, 250, 250, 1),
                          color:  Color.fromARGB(255, 6, 82, 212),
                          padding: EdgeInsets.only(top: 5.5, bottom: 5.5),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                          elevation: 4,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _girizilenDatanyBarla(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      debugPrint("Ady: $_ady  Nomeri: $_telNomeri  Emaili: $_emaili Haty: $_haty");
      final String name = _nameControl.text;
      final String phone = "+993" + _telControl.text;
      final String pocta = _poctaControl.text;
      final String hat = _hatControl.text;

    } else {
      setState(() {
        awtoKontrol = true;
      });
    }
  }




}
