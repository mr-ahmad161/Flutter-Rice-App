import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:rice/data/seller_data.dart';
import 'package:rice/data/temp_data.dart';

class BuyerScreen extends StatefulWidget {
  const BuyerScreen({Key? key}) : super(key: key);

  @override
  State<BuyerScreen> createState() => _BuyerScreenState();
}

tost() {
  Fluttertoast.showToast(
      msg: "Seller Details",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xffF5591F),
      textColor: Colors.white,
      fontSize: 16.0);
}

class _BuyerScreenState extends State<BuyerScreen> {
  List<Seller> items = [];

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
          Uri.parse('http://192.168.18.16:5000/api/readAllSellerDetails'),
          body: {});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        items = Seller.fromJson(data) as List<Seller>;
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

  @override
  void initState() {
    items.addAll(TempData.userList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Seller> dummySearchList = [];

    dummySearchList.addAll(items);
    if (query.isNotEmpty) {
      List<Seller> dummyListData = [];

      for (var item in dummySearchList) {
        if (item.location.toLowerCase().contains(query)) {
          dummyListData.add(item);
        } else {
          // ignore: avoid_print
          print("No Data Found");
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(TempData.userList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
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
          const SizedBox(
            height: 35,
          ),
          TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            //   controller: editingController,
            decoration: const InputDecoration(
                labelText: "Search Location",
                hintText: "Search here",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                // ignore: prefer_const_constructors
                return Card(
                  color: const Color.fromARGB(255, 245, 89, 31),
                  shadowColor: const Color.fromARGB(255, 230, 138, 104),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                      leading: Image.asset(
                        'assets/images/rice_logo.png',
                        height: 200,
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].contactNumber),
                      trailing: const Icon(Icons.person),
                      onTap: () {
                        //signup screen
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           Beautiful(user: items[index])

                        //           ),
                        // );
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
