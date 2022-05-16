import 'package:medicinetsdriver/models/user_model.dart';

class UserBloc {
  final User user;

  UserBloc.user({required this.user});

  Stream<User> get userStream => Stream.value(this.user);
}
