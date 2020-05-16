import 'dart:async';
import 'package:bloc/bloc.dart';
import 'profile.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{

  ProfileBloc();

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState( ProfileEvent event) async* {
    if(event is ProfileLaunchedEvent){

    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
  }
}