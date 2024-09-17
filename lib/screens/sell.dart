import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  String? _itm; 
  String? _qty; 
  int? _prc;
  File? _imgPrd;
  String? _prdUrl;

  final _formKey = GlobalKey<FormState>();

  CollectionReference prod = FirebaseFirestore.instance.collection('Fresh_Products');

  Future<void> addProd() {
    // Call the user's CollectionReference to add a new user
    return prod
        .add({
          'Item': _itm, // John Doe
          'Quantity': _qty, // Stokes and Sons
          'StartPrice': _prc,
          'Img': _prdUrl // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> _pickImg(ImageSource src) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickFle = await picker.pickImage(source: src);
    setState(() {
      if (pickFle != null) _imgPrd = File(pickFle.path);
    });
  }

  Future<void> _upldImg() async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/meme-topia/upload');

    final req = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'pu4rngzd'
      ..files.add(await http.MultipartFile.fromPath('file', _imgPrd!.path));
    final res = await req.send();
    if (res.statusCode == 200) {
      final resData = await res.stream.toBytes();
      final resStr = String.fromCharCodes(resData);
      final resJson = jsonDecode(resStr);
      setState(() {
        final urlp = resJson['url'];
        _prdUrl = urlp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(key: _formKey, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                maxLength: 100,
                style: const TextStyle(color: Color.fromRGBO(216, 233, 168, 1)),
                decoration: const InputDecoration(
                  label: Text('Produce'), 
                  labelStyle: TextStyle(color: Color.fromRGBO(216, 233, 168, 1))
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a name";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _itm = newValue!;
                },
              ),
              TextFormField(
                maxLength: 100,
                style: const TextStyle(color: Color.fromRGBO(216, 233, 168, 1)),
                decoration: const InputDecoration(
                  label: Text('Quantity'), 
                  labelStyle: TextStyle(color: Color.fromRGBO(216, 233, 168, 1))
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter quantity";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _qty = newValue!;
                },
              ),
              TextFormField(
                maxLength: 10,
                style: const TextStyle(color: Color.fromRGBO(216, 233, 168, 1)),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Price'), 
                  labelStyle: TextStyle(color: Color.fromRGBO(216, 233, 168, 1))
                ),
                validator: (value) {
                  int? prc = int.tryParse(value!);
                  if (prc == null || prc <= 0) {
                    return "Enter a valid price";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  int? prc = int.tryParse(newValue!);
                  _prc = prc!;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(30, 81, 40, 1), // background
                ),
                onPressed: () => _pickImg(ImageSource.gallery), 
                child: const Text("Upload Image", style: TextStyle(
                  color: Color.fromRGBO(216, 233, 168, 1),
                  fontSize: 12))
              ),
              if (_imgPrd != null) ... {
                Image.file(_imgPrd!),
              },
              const SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(30, 81, 40, 1), // background
                ),
                child: const Text("Submit", style: TextStyle(
                  color: Color.fromRGBO(216, 233, 168, 1),
                  fontSize: 18
                )),
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    await _upldImg();
                    _formKey.currentState!.save();
                    addProd();
                    _formKey.currentState!.reset();
                    _imgPrd = null;
                    _prdUrl = null;
                  }
                  // _formKey.currentState?.save();
                },
              ),
              Text(_prdUrl == null ? "Nothing": _prdUrl!, style: const TextStyle(color: Colors.white)), 
            ],  
          )),
        ),
      ),
      backgroundColor: const Color.fromRGBO(25, 26, 25, 1),
    );
  }
}
