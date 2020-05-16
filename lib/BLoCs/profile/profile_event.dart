import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileLaunchedEvent extends ProfileEvent {
  const ProfileLaunchedEvent();

  @override

  List<Object> get props => [];

}