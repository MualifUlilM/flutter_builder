import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama, email, phone, alamat;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File _photoProfile;
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.lightGreen,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Sukses Logout'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(Icons.logout),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[300],
            ),
            Column(
              children: [
                Container(
                  height: 160,
                  color: Colors.lightGreen,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          nama ?? 'Falah Hikamudin Arby',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          email ?? 'falah*****@gmail.com',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          phone ?? '*****123',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alamat : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          alamat ??
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non felis sed.',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    _passwordController.text = '';
                    _confirmPasswordController.text = '';
                    editProfile(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        right: 20, left: 20, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ubah Profile',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: _photoProfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.file(
                          _photoProfile,
                          width: 115,
                          height: 115,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(60)),
                        width: 115,
                        height: 115,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[800],
                          size: 40,
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future editProfile(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (conntext, StateSetter mystate) => SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 25, right: 25),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Edit Profile',
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
                          'Edit your profile',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext bc) {
                                    return SafeArea(
                                      child: Container(
                                        child: new Wrap(
                                          children: <Widget>[
                                            new ListTile(
                                                leading: new Icon(
                                                    Icons.photo_library),
                                                title:
                                                    new Text('Photo Library'),
                                                onTap: () async {
                                                  File image = await ImagePicker
                                                      .pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          imageQuality: 50);

                                                  mystate(() {
                                                    _image = image;
                                                  });
                                                  Navigator.of(context).pop();
                                                }),
                                            new ListTile(
                                              leading:
                                                  new Icon(Icons.photo_camera),
                                              title: new Text('Camera'),
                                              onTap: () async {
                                                File image =
                                                    await ImagePicker.pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                        imageQuality: 50);

                                                mystate(() {
                                                  _image = image;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                              ;
                            },
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.lightGreen,
                              child: _image != null
                                  ? Stack(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.file(
                                              _image,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              height: 30,
                                              child: Center(
                                                child: Text('Ketuk untuk ubah',
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(Icons.phone_android_outlined)),
                        ),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.multiline,
                          controller: _alamatController,
                          maxLines: 3,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Alamat',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 25.0),
                                child: Icon(Icons.home_outlined),
                              )),
                        ),
                        TextFormField(
                          obscureText: true,
                          textAlignVertical: TextAlignVertical.top,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline)),
                        ),
                        TextFormField(
                          obscureText: true,
                          textAlignVertical: TextAlignVertical.top,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                              labelText: 'Confirmation Password',
                              prefixIcon: Icon(Icons.lock_outline)),
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
                                nama = _nameController.text;
                                email = _emailController.text;
                                phone = _phoneController.text;
                                alamat = _alamatController.text;
                                _photoProfile = _image;
                                setState(() {});
                                Navigator.pop(context);
                                final snackBar = SnackBar(
                                  content: Text('Sukses Edit Profile'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text(
                              'EDIT PROFILE',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreen, // background
                              onPrimary: Colors.white, // foreground
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
