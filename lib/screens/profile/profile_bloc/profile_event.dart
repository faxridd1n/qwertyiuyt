part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

// ignore: must_be_immutable
class PostAuthUser extends ProfileEvent {
  String phoneNumber;
  PostAuthUser({required this.phoneNumber});
}
