import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/controllers/user_controller.dart';
import 'package:shikishaadmin/models/user_model.dart';

final userProvider = Provider<User>((ref) => User());

User _user = User();
// final userStream = StreamProvider<List<UserModel>>((ref) async* {
//   yield* _user.getUserData;
// });
final usersProvider = FutureProvider<List<UserModel>>((ref) async {
  return _user.getUserData;
});
