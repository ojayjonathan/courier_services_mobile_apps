import 'dart:convert';

import 'package:courier_services/models/location.dart';

class Shipment {
  int? id;
  Cargo? cargo;
  Place? origin;
  Place? destination;
  int? vehicle;
  double? price;
  String? status_;
  String? shipmentDate;
  String get status {
    return {
          "A": "Active",
          "P": "Pending",
          "C": "Canceled",
          "F": "Fulfilled"
        }[status_] ??
        "Pending";
  }

  Shipment(
      {this.id,
      this.cargo,
      this.origin,
      this.destination,
      this.vehicle,
      this.price,
      this.status_,
      this.shipmentDate});

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
        id: json['id'],
        cargo: Cargo.fromJson(json['cargo']),
        origin: Place.fromJson(json['origin']),
        destination: Place.fromJson(json['destination']),
        vehicle: json['vehicle'],
        price: double.parse(json['price'].toString()),
        status_: json['status'],
        shipmentDate: json['shipment_date']);
  }

  Map<String, dynamic> toJson() {
    return {
      "cargo": cargo?.toJson(),
      'vehicle': this.vehicle,
      'price': this.price ?? 0.0,
      'status': this.status_ ?? "P",
      'shipment_date': this.shipmentDate,
      "origin": this.origin?.toJson(),
      "destination": this.destination?.toJson(),
    };
  }

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}

Map<String, String> sizes = {"S": "Small", "M": "Medium", "L": "Large"};

class Cargo {
  String size_;
  String nature_;

  Cargo(this.size_, this.nature_);
  String get size {
    return sizes[size_.toUpperCase()]!;
  }

  String get nature => nature_ == "F" ? "Fragile" : "Not Fragile";
  factory Cargo.fromJson(Map<String, dynamic> json) {
    return Cargo(
      json['size'],
      json['nature'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "size": this.size_,
      "nature": this.nature_,
    };
  }

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
