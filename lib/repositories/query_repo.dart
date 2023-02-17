
class QueryRepo {
  // Future fetchCurrUser() async {
  //   final email = FirebaseAuth.instance.currentUser?.email;
  //   if (email != null) {
  //     _firestore.collection('users').get().then((value) {
  //       for (var doc in value.docs) {
  //         final docData = doc.data();
  //         if (docData['email'] == email) {
  //           UserStore().currUser = docData;
  //           print("This is the Correct Doc: " + docData.toString());
  //           return docData;
  //         }
  //       }
  //       print(UserStore().currUser);
  //     });
  //   }
  // }
  //
  // var applications = [];
  // var applicationsCompleted = [];
  // var orders = [];
  // var restros = [];
  //
  // Future fetchPendingApprovals() async {
  //   await _firestore.collection("providers").get().then((value) {
  //     for (var doc in value.docs) {
  //       // print("${doc.id} => ${doc.data()}");
  //       final docData = doc.data();
  //       if (docData['approval'] == false) applications.add(docData);
  //     }
  //   });
  //   return applications;
  // }
  //
  // Future fetchOrders(String? query) async {
  //   // await _firestore.collection('food').orderBy('name')
  //   if (query == "") {
  //     await _firestore.collection("food").orderBy('name').get().then((value) {
  //       for (var doc in value.docs) {
  //         // print("${doc.id} => ${doc.data()}");
  //         final docData = doc.data();
  //         orders.add(docData);
  //       }
  //     });
  //   } else {
  //     await _firestore
  //         .collection("food")
  //         .orderBy('name')
  //         .where('name', isEqualTo: query)
  //         .get()
  //         .then((value) {
  //       for (var doc in value.docs) {
  //         // print("${doc.id} => ${doc.data()}");
  //         final docData = doc.data();
  //         orders.add(docData);
  //       }
  //     });
  //   }
  //   return orders;
  // }
  //
  // Future fetchRestros(String? query) async {
  //   if (query == "") {
  //     await _firestore.collection("foodbanks").get().then((value) {
  //       for (var doc in value.docs) {
  //         // print("${doc.id} => ${doc.data()}");
  //         final docData = doc.data();
  //         restros.add(docData);
  //       }
  //     });
  //   } else {
  //     await _firestore
  //         .collection("foodbanks")
  //         .where('name', isEqualTo: query)
  //         .get()
  //         .then((value) {
  //       for (var doc in value.docs) {
  //         // print("${doc.id} => ${doc.data()}");
  //         final docData = doc.data();
  //         restros.add(docData);
  //       }
  //     });
  //   }
  //
  //   return restros;
  // }
  //
  // Future fetchCompletedApprovals() async {
  //   await _firestore.collection("providers").get().then((value) {
  //     for (var doc in value.docs) {
  //       // print("${doc.id} => ${doc.data()}");
  //       final docData = doc.data();
  //       if (docData['approval'] == true) applicationsCompleted.add(docData);
  //     }
  //   });
  //   return applicationsCompleted;
  // }
  //
  // var allProviders = [];
  //
  // Future fetchAllProviders() async {
  //   await _firestore.collection("providers").get().then((value) {
  //     for (var doc in value.docs) {
  //       // print("${doc.id} => ${doc.data()}");
  //       final docData = doc.data();
  //       allProviders.add(docData);
  //     }
  //   });
  //   return allProviders;
  // }
  //
  // Future submitProviderVerification({
  //   required String name,
  //   required String email,
  //   required String mobile,
  //   required String description,
  //   required String FSSAI,
  //   required String GST,
  //   required String imageUrl,
  //   required String aadhar,
  //   required String pan,
  //   required double lat,
  //   required double long,
  //   required String address,
  //   required String password,
  // }) async {
  //   await AuthRepo().signup(name, email, password, 'provider');
  //   try {
  //     _firestore.collection('providers').doc('$name:$email').set({
  //       'name': name,
  //       'email': email,
  //       'description': description,
  //       'mobile': mobile,
  //       'FSSAI': FSSAI,
  //       'GST': GST,
  //       'approval': false,
  //       'imageUrl': imageUrl,
  //       'panUrl': pan,
  //       'aadharUrl': aadhar,
  //       'lat': lat,
  //       'lang': long,
  //       'address': address,
  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future uploadFood(
  //     String name,
  //     // String description,
  //     String stock,
  //     String description,
  //     String imageUrl,
  //     String datetime,
  //     String timestamp,
  //     String postedBy) async {
  //   try {
  //     _firestore.collection('food').doc().set({
  //       'name': name,
  //       'description': description,
  //       'imageUrl': imageUrl,
  //       'stock': stock,
  //       'date': datetime,
  //       'timeStamp': timestamp,
  //       'postedBy': postedBy
  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future approveProvider(String id, var map) async {
  //   try {
  //     _firestore.collection('providers').doc(id).update({'approval': true});
  //     _firestore.collection('foodbanks').doc().set(map);
  //     return true;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
