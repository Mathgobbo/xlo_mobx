

import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlomobx/components/error_box.dart';
import 'package:xlomobx/screens/signup/components/field_title.dart';
import 'package:xlomobx/stores/signup_store.dart';

class SignupScreen extends StatelessWidget {

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                      builder: (context) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: ErrorBox(message: signupStore.error),
                      ),
                    ),
                    FieldTitle(title: "Apelido", subtitle: "Como aparecerá em seus anúncios",),
                    Observer(
                      builder: (context) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setName,
                        decoration: InputDecoration(
                          errorText: signupStore.nameError,
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: "Exemplo: João S.",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(title: "Email", subtitle: "Enviaremos um email de confirmação",),
                    Observer(
                      builder: (context) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setEmail,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.emailError,
                          hintText: "Exemplo: joaoa@gmail.com",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(title: "Celular", subtitle: "Proteja sua conta",),
                    Observer(
                      builder: (context) => TextField(
                        enabled: !signupStore.loading,
                        keyboardType: TextInputType.phone,
                        onChanged: signupStore.setPhone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          errorText: signupStore.phoneError,
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: "(99) 9999466",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(title: "Senha", subtitle: "Use leras números e caracteres especiais",),
                    Observer(
                      builder: (context) => TextField(
                        enabled: !signupStore.loading,
                        obscureText: true,
                        onChanged: signupStore.setPass1,
                        decoration: InputDecoration(
                            errorText: signupStore.pass1Error,
                            border: const OutlineInputBorder(),
                            isDense: true
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(title: "Confirmar senha", subtitle: "Repita a senha",),
                    Observer(
                      builder: (context) => TextField(
                        enabled: !signupStore.loading,
                        obscureText: true,
                        onChanged: signupStore.setPass2,
                        decoration: InputDecoration(
                            errorText: signupStore.pass2Error,
                            border: const OutlineInputBorder(),
                            isDense: true
                        ),
                      ),
                    ),
                    Observer(
                      builder: (context) => Container(
                        height: 40,
                        margin: EdgeInsets.only(top: 20, bottom: 12),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          textColor: Colors.white,
                          child: signupStore.loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),) : Text("CADASTRAR"),
                          elevation: 0,
                          onPressed: signupStore.signUpPressed,
                        ),
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 9),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text("Já possui uma conta?", style: TextStyle(fontSize: 16)),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text("Entrar", style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple, fontSize: 16),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
