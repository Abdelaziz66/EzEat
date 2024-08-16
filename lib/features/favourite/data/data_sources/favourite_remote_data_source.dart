import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/constant.dart';

abstract class FavouriteRemoteDataSource{

  Future<void> addToFavourite({required String itemId});
  Future<void> removeFromFavourite({required String itemId});


}
class FavouriteRemoteDataSourceImpl extends FavouriteRemoteDataSource{
  @override
  Future<void> addToFavourite({required String itemId})async {

    Map<String,dynamic> x = {
      'itemId':itemId,
      'favourite':true,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId).collection('favourite').doc(itemId)
        .set(x)
        .then((value) {


    });
  }

  @override
  Future<void> removeFromFavourite({required String itemId}) async{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId).collection('favourite').doc(itemId).delete()
        .then((value) {

    });
  }


}