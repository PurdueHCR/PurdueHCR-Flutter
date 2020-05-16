import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:purduehcr_web/Models/House.dart';
import 'package:purduehcr_web/Models/PointLog.dart';
import 'package:purduehcr_web/Models/Reward.dart';
import 'package:purduehcr_web/Models/UserRank.dart';

abstract class ProfileState extends Equatable{
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final UserRank rank;
  final List<PointLog> logs;
  final Reward reward;
  final List<House> houses;

  const ProfileLoaded({@required this.rank, @required this.logs, @required this.reward, @required this.houses});
  @override
  List<Object> get props => [rank, logs, reward, houses];
}