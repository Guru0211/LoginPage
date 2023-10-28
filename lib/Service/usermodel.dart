class userModel{
  final String username;
  final String useremail;
  final String password;

  const userModel({
    required this.username,
    required this.useremail,
    required this.password,
});


  toJson(){
    return{
      "Username":username,
      "UserEmail":useremail,
      "Password":password,
    };
  }

}



