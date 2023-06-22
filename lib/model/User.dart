class User {
  final String username;
  final String first;
  final String? last; // Example of an optional value (nullable)
  final String? image;

  User({required this.username, required this.first, this.last, this.image});

  /* Named constructor to return a user object representing "no user"
       to avoid dealing with nulls (e.g., when a user is not found)
   */
  User.noUser(): username="", first="", last=null, image=null;

  bool isNoUser() {
    return username == "";
  }

  // Named constructor
  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        first = json['first'],
        last = json['last'],
        image = json['image'];

  Map<String, dynamic> toJson() =>
      {'username': username, 'first': first, 'last': last, 'image': image};
}
