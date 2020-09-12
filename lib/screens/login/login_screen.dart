import 'package:flutter/material.dart';
import 'package:xlomobx/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Acessar com email:", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey[900])),
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text("Email", style: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w700),),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Senha", style: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w700),),
                          GestureDetector(
                            child: Text("Esqueceu sua senha", style: TextStyle(color: Colors.purple, decoration: TextDecoration.underline),),
                            onTap: (){},
                          )
                        ],
                      )
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true
                      ),
                    ),

                    Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 20, bottom: 12),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color: Colors.orange,
                        textColor: Colors.white,
                        child: Text("ENTRAR"),
                        elevation: 0,
                        onPressed: (){},
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 9),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text("Não tem uma conta?", style: TextStyle(fontSize: 16)),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen(),));
                            },
                            child: Text("Cadastre-se", style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple, fontSize: 16),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
