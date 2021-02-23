import 'package:flutter/material.dart';
import 'package:flutter_appl/pages/find/company.dart';

class CompanyItem extends StatelessWidget {
  
  final Company model;

  CompanyItem(this.model);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: Card(
        elevation: 10,
        child: new Column(
          children: <Widget>[
              Row(
                children: <Widget>[
                  new Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 10.0,
                  bottom: 0
                ),
                child: Image.network(
                  model.logo,
                  width: 50.0, height: 50.0, 
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                        top: 5.0,
                        left: 0.0,
                        right: 5.0,
                        bottom: 5.0,),
                  child: Text(
                    model.location.substring(0, model.location.length>6?6: model.location.length),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 5.0,
                    left: 5.0,
                    right: 10.0,
                    bottom: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text(
                          "|"+model.type,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "|" + model.size,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "|" + model.employee,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )
                    ],
                ),
              ),
            ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      right: 5.0,
                      bottom: 15.0,
                  ),
                  child: new Text(
                        "热招：" +
                            model.hot +
                            " 等" +
                            model.count +
                            "个职位",
                        style:
                        new TextStyle(fontSize: 13.0, color: Colors.grey)
                  ),
                ),
                Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                      )
                    ], 
                  ),
                ),
              ], 
            )
          ], 
        ),
      ),
    );
  }
}