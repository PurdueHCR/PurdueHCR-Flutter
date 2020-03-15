import 'package:flutter/material.dart';
import 'package:purduehcr_web/PointType.dart';

class SubmitPointsPage extends StatelessWidget {
  const SubmitPointsPage({Key key}) : super(key: key);

  Widget createCell(PointType pointType) {
    return Card(
        color: Colors.blue,
        child: SizedBox(
          width: 600,
          height: 50,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child:
                  Text(pointType.name,
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child:
                  Text(pointType.value.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                )
              ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<PointType> samplePointTypes = PointType.getSamplePointTypes();

    return Center(
        child: Card(
            color: Colors.white,
            child: SizedBox(
              width: 800,
              height: 500,
              child: ListView.builder(
                  itemCount: samplePointTypes.length,
                  itemBuilder: (context, index) {
                    return createCell(samplePointTypes[index]);
                  }),
            )));
  }
}
