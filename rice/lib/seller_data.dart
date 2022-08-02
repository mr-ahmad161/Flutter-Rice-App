import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:rice/seller_screen.dart';

class Sellerdata extends StatefulWidget {
  const Sellerdata({Key? key}) : super(key: key);

  @override
  State<Sellerdata> createState() => _SellerdataState();
}

class _SellerdataState extends State<Sellerdata> {
  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController numberofbagController = TextEditingController();
    TextEditingController totalWeightController = TextEditingController();
    TextEditingController typeOfRiceController = TextEditingController();
    TextEditingController totolPriceController = TextEditingController();

    tost() {
      Fluttertoast.showToast(
          msg: "Succesfully Submited",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xffF5591F),
          textColor: Colors.white,
          fontSize: 16.0);
    }

    Future<void> uploadData(
        String fullName,
        String phone,
        String location,
        String numberofBag,
        String totalWeight,
        String typeOfRice,
        String totalPrice) async {
      try {
        Response response = await post(
            Uri.parse('http://192.168.18.16:5000/api/save/sellerDetails'),
            body: {
              'name': fullName,
              'contactNumber': phone,
              'location': location,
              'aomuntOfMasses': numberofBag,
              'weight': totalWeight,
              'typeOfRice': typeOfRice,
              'pricePerMasss': totalPrice,
            });

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          // ignore: avoid_print
          print(data['token']);
          // ignore: avoid_print
          print('Data  successfully uploded');
          tost();
        } else {
          // ignore: avoid_print
          print('failed');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    }

    clearTextField() {
      fullNameController.clear();
      phoneController.clear();
      locationController.clear();
      numberofbagController.clear();
      totalWeightController.clear();
      typeOfRiceController.clear();
      totolPriceController.clear();
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
            color: Color(0xffF5591F),
            gradient: LinearGradient(
              colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/logo.png",
                  height: 120,
                  width: 120,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.bottomRight,
                child: const Text(
                  "Rice App",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          )),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            keyboardType: TextInputType.name,
            controller: fullNameController,
            autocorrect: true,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Full Name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            controller: phoneController,
            keyboardType: TextInputType.phone,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.phone,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Phone Number",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            controller: locationController,
            keyboardType: TextInputType.text,
            autocorrect: true,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              focusColor: Color(0xffF5591F),
              icon: Icon(
                Icons.location_city,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter City Location",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            controller: numberofbagController,
            keyboardType: TextInputType.number,
            obscureText: true,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              focusColor: Color(0xffF5591F),
              icon: Icon(
                Icons.badge,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Number Of Bag",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            controller: totalWeightController,
            keyboardType: TextInputType.number,
            obscureText: true,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              focusColor: Color(0xffF5591F),
              icon: Icon(
                Icons.line_weight,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Total Weight Of Bag",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            controller: typeOfRiceController,
            keyboardType: TextInputType.text,
            obscureText: true,
            autocorrect: true,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              focusColor: Color(0xffF5591F),
              icon: Icon(
                Icons.type_specimen_outlined,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Type Of Rice",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            autofocus: false,
            controller: totolPriceController,
            keyboardType: TextInputType.number,
            obscureText: true,
            cursorColor: const Color(0xffF5591F),
            decoration: const InputDecoration(
              focusColor: Color(0xffF5591F),
              icon: Icon(
                Icons.price_change,
                color: Color(0xffF5591F),
              ),
              hintText: "Enter Total Price Of Rice",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await uploadData(
                fullNameController.text.toString(),
                phoneController.text.toString(),
                locationController.text.toString(),
                numberofbagController.text.toString(),
                totalWeightController.text.toString(),
                typeOfRiceController.text.toString(),
                totolPriceController.text.toString());
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SellerScreen(),
              ),
            );
            clearTextField();
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: const Text(
              "SUBMIT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    )));
  }
}
