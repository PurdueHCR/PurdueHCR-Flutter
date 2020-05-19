import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purduehcr_web/BLoCs/overview/overview.dart';
import 'package:purduehcr_web/Main_Page_Fragments/ResidentOverviewWidget.dart';
import 'package:purduehcr_web/Utilities/DisplayTypeUtil.dart';
import 'package:purduehcr_web/Utility_Views/LoadingWidget.dart';
import 'package:purduehcr_web/Utility_Views/PhcrDrawer.dart';
import 'BLoCs/authentication/authentication.dart';
import 'Models/UserPermissionLevel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  OverviewBloc _overviewBloc;

  @override
  void initState() {
    _overviewBloc = new OverviewBloc();
    AuthenticationAuthenticated auth = BlocProvider.of<AuthenticationBloc>(context).state;
    _overviewBloc.add(OverviewLaunchedEvent(permissionLevel: auth.user.permissionLevel, token: auth.token));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);

    if(isDesktop) {
      return Scaffold(
          body: Row(
            children: [
              PhcrDrawer("Overview"),
              Expanded(
                child: Column(
                  children: [
                    AppBar(
                      title: Text("Purdue HCR"),
                    ),
                    _buildBody(),
                  ],
                ),
              )
            ],
          )
      );
    }
    else{
      return Scaffold(
          appBar: AppBar(
            title: Text("Purdue HCR"),
          ),
          drawer: PhcrDrawer("Overview"),
          body: _buildBody()
      );
    }


  }

    Widget _buildBody(){
      return BlocProvider<OverviewBloc>(
        builder: (context) => _overviewBloc,
        child:BlocBuilder<OverviewBloc, OverviewState>(
          bloc: _overviewBloc,
          builder: (context, state) {
            if(state is ResidentOverviewLoaded){
              return ResidentOverview();
            }
            else if(state is OverviewError){
              return Center(
                child: Column(
                  children: [
                    Text("ERROR: "+state.error.toString()),
                  ],
                ),
              );
            }
            else{
              return LoadingWidget();
            }
          },
        ),
      );
    }

  @override
  void dispose() {
    _overviewBloc.close();
    super.dispose();
  }

}

