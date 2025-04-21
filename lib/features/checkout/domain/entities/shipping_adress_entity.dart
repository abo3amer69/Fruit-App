class ShippingAdressEntity {
  String? name;
  String? phone;
  String? adress;
  String? city;
  String? email;

  String? floor;

  ShippingAdressEntity({
    this.name,
    this.phone,
    this.adress,
    this.floor,
    this.city,
    this.email,
  });

  @override
  String toString() {
    return '$adress, $floor, $city';
  }
}
