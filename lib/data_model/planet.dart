class Planet {
  int id;
  String name = 'planet_name';
  String description = 'planet_desc';
  String rotation = 'planet_rot';
  String revolution = 'planet_evo';
  bool liveable = false;
  bool isFavourite = false;
  String image = '';

  Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.rotation,
    required this.revolution,
    required this.liveable,
    required this.image,
    required this.isFavourite,
  });

  static Planet fromJSON(Map<String, dynamic> jsonData) {
    return Planet(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      rotation: jsonData['rotation'],
      revolution: jsonData['revolution'],
      liveable: jsonData['liveable'],
      isFavourite: jsonData['isFavourite'],
      image: jsonData['image'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'rotation': rotation,
      'revolution': revolution,
      'liveable': liveable,
      'isFavourite': isFavourite,
      'image': image,
    };
  }
}
