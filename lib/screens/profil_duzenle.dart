// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:firstrip/screens/root_app.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class ProfilDuzenle extends StatefulWidget {
  const ProfilDuzenle({Key? key}) : super(key: key);

  @override
  State<ProfilDuzenle> createState() => _ProfilDuzenleState();
}

class _ProfilDuzenleState extends State<ProfilDuzenle> {
  final TextEditingController _t1 = TextEditingController();
  final GlobalKey<FormState> _t1key = GlobalKey<FormState>();
  final TextEditingController _s1 = TextEditingController();
  final GlobalKey<FormState> _s1key = GlobalKey<FormState>();
  final TextEditingController _f1 = TextEditingController();
  final GlobalKey<FormState> _f1key = GlobalKey<FormState>();
  File? _secilenDosya;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Expanded(
                              flex: 1, child: Icon(Icons.arrow_back_ios))),
                      const SizedBox(
                        width: 86,
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Profil Düzenle",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Patrick"),
                        ),
                      ),
                      const SizedBox(
                        width: 65,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      child: _secilenDosya == null
                          ? const Image(
                              image: AssetImage(
                                "assets/images/person.png",
                              ),
                              fit: BoxFit.contain,
                            )
                          : null,
                      radius: 80,
                      backgroundImage: _secilenDosya != null
                          ? FileImage(_secilenDosya!)
                          : null,
                    )),
                Expanded(
                    flex: 0,
                    child: InkWell(
                        onTap: () {
                          _secimFotoGoster(context);
                        },
                        child: const Icon(Icons.add_a_photo))),
                const SizedBox(
                  height: 50,
                ),
                IsimDegistir(t1key: _t1key, t1: _t1),
                const SizedBox(
                  height: 15,
                ),
                EmailDuzenle(s1key: _s1key, s1: _s1),
                const SizedBox(height: 15),
                TelefonNumarasi(f1key: _f1key, f1: _f1),
                const SizedBox(
                  height: 50,
                ),
                const Expanded(child: DuzenleButonu()),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _secimFotoGoster(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Galeriden fotoğraf seç"),
                    onTap: () {
                      _secimYukle(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    title: const Text("Kameradan fotoğraf çek"),
                    onTap: () {
                      _secimYukle(ImageSource.camera);
                    },
                  )
                ],
              ),
            ));
  }

  void _secimYukle(ImageSource source) async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final secilen = await picker.getImage(source: source);
    setState(() {
      if (secilen != null) {
        _secilenDosya = File(secilen.path);
        //_fotografKes(File(secilen.path));
      }
    });
    Navigator.pop(context);
  }
}

class IsimDegistir extends StatelessWidget {
  const IsimDegistir({
    Key? key,
    required GlobalKey<FormState> t1key,
    required TextEditingController t1,
  })  : _t1key = t1key,
        _t1 = t1,
        super(key: key);

  final GlobalKey<FormState> _t1key;
  final TextEditingController _t1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _t1key,
          autovalidateMode: AutovalidateMode.always,
          child: TextFormField(
            controller: _t1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFF8D242), width: 1.0)),
              focusColor: const Color(0xFFF8D242),
              label: const Text(
                "Tam İsim",
              ),
              labelStyle: const TextStyle(
                  fontSize: 23, color: Colors.black, fontFamily: "Patrick"),
              alignLabelWithHint: false,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailDuzenle extends StatelessWidget {
  const EmailDuzenle({
    Key? key,
    required GlobalKey<FormState> s1key,
    required TextEditingController s1,
  })  : _s1key = s1key,
        _s1 = s1,
        super(key: key);

  final GlobalKey<FormState> _s1key;
  final TextEditingController _s1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _s1key,
          autovalidateMode: AutovalidateMode.always,
          child: TextFormField(
            controller: _s1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFF8D242), width: 1.0)),
              focusColor: const Color(0xFFF8D242),
              label: const Text(
                "Email Adres",
              ),
              labelStyle: const TextStyle(
                  fontSize: 23, color: Colors.black, fontFamily: "Patrick"),
              alignLabelWithHint: false,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TelefonNumarasi extends StatelessWidget {
  const TelefonNumarasi({
    Key? key,
    required GlobalKey<FormState> f1key,
    required TextEditingController f1,
  })  : _f1key = f1key,
        _f1 = f1,
        super(key: key);

  final GlobalKey<FormState> _f1key;
  final TextEditingController _f1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _f1key,
          autovalidateMode: AutovalidateMode.always,
          child: TextFormField(
            controller: _f1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFF8D242), width: 1.0)),
              focusColor: const Color(0xFFF8D242),
              label: const Text(
                "Telefon Numarası",
              ),
              labelStyle: const TextStyle(
                  fontSize: 23, color: Colors.black, fontFamily: "Patrick"),
              alignLabelWithHint: false,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DuzenleButonu extends StatelessWidget {
  const DuzenleButonu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const RootApp())));
      },
      color: const Color(0xFF252525),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 90,
          right: 90,
        ),
        child: Text(
          "Profil Düzenle",
          style: TextStyle(
              fontSize: 21, color: Color(0xFFFFFFFF), fontFamily: "Patrick"),
        ),
      ),
    );
  }
}
