import 'package:flutter/src/widgets/framework.dart';
import 'package:purduehcr_web/BasePage.dart';

class SubmitPointsPage extends BasePage{

  @override
  State<StatefulWidget> createState() {
    return SubmitPointsPageState(drawerLabel: "Submit Points");
  }

}

class SubmitPointsPageState extends BasePageState{

  OverviewBloc _overviewBloc;

  SubmitPointsPageState({@required String drawerLabel}):super(drawerLabel:drawerLabel);

  @override
  void initState() {
    super.initState();
    _overviewBloc = new OverviewBloc();
    _overviewBloc.add(OverviewLaunchedEvent(permissionLevel: auth.user.permissionLevel, token: auth.token));
  }


  @override
  Widget buildDesktopBody() {
    // TODO: implement buildDesktopBody
    throw UnimplementedError();
  }

  @override
  Widget buildMobileBody() {
    // TODO: implement buildMobileBody
    throw UnimplementedError();
  }

  Widget _buildBody(){

  }
}