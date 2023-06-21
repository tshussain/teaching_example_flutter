class User {
  final String id;
  final String username;
  final String first;
  final String last;
  final String image;

  User(
      {required this.id,
      required this.username,
      required this.first,
      required this.last,
      required this.image});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        first = json['first'],
        last = json['last'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'first': first,
        'last': last,
        'image': image
      };
}
