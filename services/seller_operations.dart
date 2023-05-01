import 'package:ecomm_app/models/message.dart';
import 'package:ecomm_app/models/seller.dart';
import 'package:ecomm_app/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellerOperations {
  // add() {} --> new user registration
  // update() {} --> update an existing user
  // remove() {} --> deactivate the user account

  // Step 1: Create an instance of firebase Auth service
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register
  Future<Message> add(Seller seller) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: seller.userId, password: seller.password);
      Message msg = Message.takeMessage(
          message: 'Registration is successful!', code: Constants.SUCCESS);
      return msg;
    } catch (e) {
      return Message.takeMessage(
          message: 'Registration Failed!', code: Constants.FAIL);
    }
  }

  Future<Message> read(Seller seller) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: seller.userId, password: seller.password);
      return Message.takeMessage(
          message: 'Login successful!', code: Constants.SUCCESS);
    } catch (err) {
      return Message.takeMessage(
          message: 'Login Failed!', code: Constants.FAIL);
    }
  }
}
