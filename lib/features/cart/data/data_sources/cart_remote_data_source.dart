import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/constant.dart';

abstract class CartRemoteDataSource{

  Future<void> addToCart({required String itemId});
  Future<void> removeFromCart({required String itemId});


}
class CartRemoteDataSourceImpl extends CartRemoteDataSource{
  @override
  Future<void> addToCart({required String itemId})async {

    Map<String,dynamic> data = {
      'itemId':itemId,
      'cart':true,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId).collection('cart').doc(itemId)
        .set(data);
  }

  @override
  Future<void> removeFromCart({required String itemId}) async{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId).collection('cart').doc(itemId).delete();
  }


}