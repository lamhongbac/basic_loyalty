class AuthService{

  static String currentUser='';
  static Future<String> createAccountWithEmail(String email, String password) async{
   
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email,password:password);
      currentUser='QAUser';
      return 'AccountCreated';
    

  }

  //login
  static Future<String> loginWithEmail(String email, String password) async{
   
      return 'LoginSuccessful';
    

  }
  //logout
  static Future<String> logout() async{
   currentUser='';
      return 'LogoutSuccessful';
   
  }
    //isLogin
     //logout
  static Future<bool> isLogin() async{
   
    return currentUser!='';

  }

  
}