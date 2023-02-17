
class AuthRepo {
  // Future login(String email, String password) async {
  //   try {
  //     print('clicked');
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     print('login successful');
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }
  //
  // Future signup(String name, String email, String password, String role) async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     _firestore.collection('users').doc().set({
  //       'email': email,
  //       'name': name,
  //       'role': 'customer'
  //     });
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
