import 'package:chatapp/model/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  //for authentication
  static final FirebaseAuth auth = FirebaseAuth.instance;

  //for accessing cloud fireStore DB
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // get current user data from fireStore
  static User get user => auth!.currentUser!;

  //for checking user exists?
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  //for getting current user info
  static Future<void> getSelfInfo() async {
    await firestore.collection('users').doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        print('My Data : ${user.data()}');
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  //for stor self info
  static late ChatUser me;

  //for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
        isOnline: false,
        id: auth.currentUser!.uid,
        createdAt: time.toString(),
        pushToken: '',
        image: user.photoURL.toString(),
        email: user.email.toString(),
        about: 'this is about',
        lastActive: time,
        name: user.displayName.toString());
    return (await firestore
        .collection('users')
        .doc(chatUser.id)
        .set(chatUser.toJson()));
  }

  //getting all user from firestore DB
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return firestore
        .collection('users')
        .where('id', isNotEqualTo: user.uid)
        .snapshots();
  }

  //update user info
  static Future<void> updateUserInfo() async {
    await firestore
        .collection('users')
        .doc(user.uid)
        .update({'name': me.name, "about": me.about});
  }
}
