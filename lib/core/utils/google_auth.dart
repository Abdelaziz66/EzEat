import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService{
 static Future signInWithGoogle()async{


    try{
      final GoogleSignInAccount? gUser= await GoogleSignIn().signIn().catchError((onError){
        print('=========================1============');
        print(onError.toString());
      });

      final GoogleSignInAuthentication gAuth=await gUser!.authentication;

      final credential= GoogleAuthProvider.credential(
        accessToken:gAuth.accessToken ,
        idToken:gAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch (onError){
      print('=========================3============');

      print(onError.toString());

    }
  }
}