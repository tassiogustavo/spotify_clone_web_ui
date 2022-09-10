import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_web_ui/pages/catalog_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textLogin = TextEditingController();
  final _textSenha = TextEditingController();
  bool _validateLogin = false;
  bool _validateSenha = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 92,
              width: 170,
              child: SvgPicture.asset('assets/spotify-logo.svg'),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black26,
            ),
            verticalSpace(38),
            buildText(
              'Para continuar, faça login no Spotify.',
              Colors.black,
              FontWeight.bold,
              11,
            ),
            verticalSpace(10),
            buildButtomLoginOption(
              const Color.fromRGBO(59, 89, 152, 1),
              const Color.fromRGBO(59, 89, 152, 1),
              true,
              'assets/facebook-logo.svg',
              'C O N T I N U A R  C O M  O  F A C E B O O K',
              const Color.fromRGBO(255, 255, 255, 0.9),
            ),
            verticalSpace(10),
            buildButtomLoginOption(
              Colors.black,
              Colors.black,
              true,
              'assets/apple-logo.svg',
              'C O N T I N U A R  C O M  A  A P P L E',
              const Color.fromRGBO(255, 255, 255, 0.9),
            ),
            verticalSpace(10),
            buildButtomLoginOption(
              Colors.white,
              Colors.black54,
              true,
              'assets/google-logo.svg',
              'C O N T I N U A R  C O M  O  G O O G L E',
              const Color.fromRGBO(106, 106, 106, 1),
            ),
            verticalSpace(10),
            buildButtomLoginOption(
              Colors.white,
              Colors.black54,
              false,
              'Icons.book',
              'C O N T I N U A R  C O M  U M  N Ú M E R O  D E  T E L E F O N E',
              const Color.fromRGBO(106, 106, 106, 1),
            ),
            verticalSpace(15),
            buildLineOU(),
            verticalSpace(22),
            SizedBox(
              width: 407,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(
                    'Endereço de e-mail ou nome de usuário',
                    Colors.black,
                    FontWeight.bold,
                    11,
                  ),
                  verticalSpace(8),
                  TextField(
                    controller: _textLogin,
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                    onChanged: (text) {
                      setState(() {
                        _textLogin.text.isEmpty
                            ? _validateLogin = true
                            : _validateLogin = false;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Endereço de e-mail ou nome de usuário',
                      errorText: _validateLogin
                          ? 'Insira seu nome de usuário ou endereço de e-mail do Spotify.'
                          : null,
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      border: const OutlineInputBorder(
                          gapPadding: 3,
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  verticalSpace(9),
                  buildText(
                    'Senha',
                    Colors.black,
                    FontWeight.bold,
                    11,
                  ),
                  verticalSpace(9),
                  TextField(
                    controller: _textSenha,
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                    onChanged: (text) {
                      setState(() {
                        _textSenha.text.isEmpty
                            ? _validateSenha = true
                            : _validateSenha = false;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Endereço de e-mail ou nome de usuário',
                      errorText: _validateSenha
                          ? 'Por favor, insira sua senha.'
                          : null,
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      border: const OutlineInputBorder(
                        gapPadding: 3,
                      ),
                    ),
                  ),
                  verticalSpace(9),
                  InkWell(
                    onTap: () {},
                    child: buildText(
                      'Esqueceu sua senha?',
                      Colors.black,
                      FontWeight.normal,
                      13,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: Transform.scale(
                          scale: 0.85,
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                 _isChecked = value!;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            value: _isChecked,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'Lembrar de mim',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 11,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CatalogList(),
                            ),
                          );
                        },
                        child: Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(30, 215, 96, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'E N T R A R',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  Container(
                    height: 1.2,
                    width: double.infinity,
                    color: Colors.black26,
                  ),
                  verticalSpace(27),
                  buildText(
                    'Não tem uma conta?',
                    Colors.black,
                    FontWeight.bold,
                    14,
                  ),
                  verticalSpace(20),
                  buildButtomLoginOption(
                    Colors.white,
                    Colors.black54,
                    false,
                    'Icons.book',
                    'I N S C R E V E R - S E  N O  S P O T I FY',
                    const Color.fromRGBO(106, 106, 106, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  Text buildText(String text, Color color, FontWeight fontWeight, double size) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }

  SizedBox buildLineOU() {
    return SizedBox(
      width: 407,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1.2,
              color: Colors.black26,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'OU',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1.2,
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtomLoginOption(Color corFundo, Color corBorda,
      bool iconVisibility, String imgIcon, String text, Color corFonte) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 42,
        width: 407,
        decoration: BoxDecoration(
          color: corFundo,
          border: Border.all(
            color: corBorda,
            width: 0.9,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: iconVisibility,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset(imgIcon),
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  color: corFonte, fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
