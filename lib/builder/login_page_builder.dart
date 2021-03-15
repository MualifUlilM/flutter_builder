import 'package:flutter/material.dart';
import 'package:my_app/builder/profil_page_builder.dart';
import 'package:my_app/builder/register_page_builder.dart';

class LoginPageBuilder extends StatefulWidget {
  Map<String, dynamic> data;
  LoginPageBuilder({@required this.data});
  @override
  _LoginPageBuilderState createState() => _LoginPageBuilderState();
}

class _LoginPageBuilderState extends State<LoginPageBuilder> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.lightGreen),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(0.5),
                      offset: Offset(1, 1),
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(primaryColor: Colors.lightGreen),
                  child: TextFormField(
                    style: TextStyle(color: Colors.lightGreen[700]),
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Icon(
                          Icons.email_outlined,
                          size: 30,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 35, right: 0, top: 10, bottom: 20),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(0.5),
                      offset: Offset(1, 1),
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(primaryColor: Colors.lightGreen),
                  child: TextFormField(
                    style: TextStyle(color: Colors.lightGreen[700]),
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Icon(
                          Icons.lock_outlined,
                          size: 30,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 35, right: 0, top: 10, bottom: 20),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _email.text = '';
                      _password.text = '';
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Sukses')));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilPage()));
                    }
                  },
                  child: Text(
                    'LOG IN',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have account ?  '),
                  GestureDetector(
                    onTap: () {
                      _email.text = '';
                      _password.text = '';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'create a new account',
                      style: TextStyle(
                          color: Colors.lightGreen[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
