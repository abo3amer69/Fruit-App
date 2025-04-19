import 'package:fruit_app/features/checkout/domain/entities/shipping_adress_entity.dart';

class ShippingAdressModel {
   String? name;
   String? phone;
   String? adress;
   String? city;
   String? email;
   
   String ? floor;

  ShippingAdressModel(
   { this.name,
    this.phone,
    this.adress,
    this.floor,
    this.city,
    this.email,
    }
  );
  factory ShippingAdressModel.fromEntity(ShippingAdressEntity entity) {
    return ShippingAdressModel(
      name: entity.name,
      phone: entity.phone,
      adress: entity.adress,
      floor: entity.floor,
      city: entity.city,
      email: entity.email,
    );
  }

  @override
  String toString() {
    
    return '$adress, $floor, $city';
  }

  toJson(){
    return{
      'name':name,
      'phone':phone,
      'adress':adress,
      'floor':floor,
      'city':city,
      'email':email,
    };   
  }
}
