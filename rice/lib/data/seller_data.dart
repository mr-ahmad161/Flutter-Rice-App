
import 'dart:convert';

List<Seller> sellerFromJson(String str) => List<Seller>.from(json.decode(str).map((x) => Seller.fromJson(x)));

String sellerToJson(List<Seller> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Seller {
    Seller({
       required this.id,
       required this.name,
        required this.contactNumber,
       required this.location,
        required this.aomuntOfMasses,
        required this.weight,
        required this.typeOfRice,
        required this.pricePerMasss,
       
    });

    String id;
    String name;
    String contactNumber;
    String location;
    String aomuntOfMasses;
    String weight;
    String typeOfRice;
    String pricePerMasss;
  
    factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["_id"],
        name: json["name"],
        contactNumber: json["contactNumber"],
        location: json["location"],
        aomuntOfMasses: json["aomuntOfMasses"],
        weight: json["weight"],
        typeOfRice: json["typeOfRice"],
        pricePerMasss: json["pricePerMasss"],
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "contactNumber": contactNumber,
        "location": location,
        "aomuntOfMasses": aomuntOfMasses,
        "weight": weight,
        "typeOfRice": typeOfRice,
        "pricePerMasss": pricePerMasss,
      
    };
}
