import 'package:firstrip/VerittabaniIslemleri/AuthService.dart';
import 'package:firstrip/screens/profil_duzenle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController isimController = TextEditingController();
  TextEditingController sifireController = TextEditingController();
  TextEditingController sifireController2 = TextEditingController();
  AuthService newUser = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hızılca Bir hesap oluştur, Ücretsiz",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  TextField(
                    controller: isimController,
                    decoration:
                        const InputDecoration(hintText: "Kullanıcı İsmi"),
                  ),
                  TextField(
                    controller: sifireController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Şifre",
                    ),
                  ),
                  TextField(
                    controller: sifireController2,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Şifre tekrar",
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: Colors.green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      //KullaniciKontrol yeniKullanici = KullaniciKontrol();
                      //int donecek = await yeniKullanici.kayitol(nickController.text,
                      //emailController.text, passController.text);
                      if (sifireController.text == sifireController2.text) {
                        newUser
                            .createUser(isimController.text,
                                emailController.text, sifireController.text)
                            .then((value) {
                          if (value != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfilDuzenle(
                                    key: null,
                                  ),
                                ));
                          } else {
                            showDialog(
                              context: context,
                              builder: (builder) => AlertDialog(
                                title: const Text("Uyarı"),
                                content: const Text("Kayıt Başarışız"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Tamam"),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                            title: const Text("Uyarı"),
                            content: const Text("Şifreler Uyuşmuyor"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Tamam"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    color: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Kayıt Ol",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("Hesabın var mı?"),
                  Text(
                    " Giriş Yap",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
