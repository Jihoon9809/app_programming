class Myuser {
  String? uid;
  String? email;

  Myuser({this.uid, this.email});

  factory Myuser.fromMap(map) {
    return Myuser(
      uid: map['uid'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
