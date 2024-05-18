class Product {
  final String id;
  final String name;
  final String label;
  final double price;
  final String image;
  final String rating;
  final String duration;
  int quantity;
  bool isAdded;

  Product({
    required this.id, required this.name,required this.label, required this.price,
    required this.image,required this.rating, required this.duration,this.quantity=0,this.isAdded=false
  });
}