import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Register Account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Create your new account',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
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
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Icon(
                          Icons.person_outline_outlined,
                          size: 30,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 35, right: 0, top: 10, bottom: 20),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                    controller: _emailController,
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
                height: 15,
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
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Icon(
                          Icons.phone_iphone,
                          size: 30,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 35, right: 0, top: 10, bottom: 20),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nomor Handphone tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: TextStyle(color: Colors.lightGreen[700]),
                    controller: _alamatController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 10, bottom: 70),
                        child: Icon(
                          Icons.home_outlined,
                          size: 30,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 35, right: 0, top: 10, bottom: 20),
                      labelText: 'Alamat',
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                    controller: _passwordController,
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
                      } else if (value.length < 7) {
                        return "Password tidak boleh kurang dari 7 karakter";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password Confirmation',
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
                        return 'Password Konfirmasi tidak boleh kosong';
                      } else if (value != _passwordController.text) {
                        return 'Password tidak sama';
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
                      Navigator.pop(context);
                      final snackBar = SnackBar(
                        content: Text('Sukses Registrasi'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    'REGISTER',
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
                  Text('Already have account ?  '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.lightGreen[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
