class UserEntity {
  final String name;
  final String email;

  final String uid;

  UserEntity({required this.name, required this.email, required this.uid});

  tomap(){
    return {
      
      'name':name,
      'email':email,
      'uid':uid
    };
  }
}
