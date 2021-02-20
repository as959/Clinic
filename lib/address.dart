import 'package:flutter/material.dart';
import 'package:upcloud_clinic/holidays.dart';

class ClinicAddress extends StatefulWidget {
  @override
  _ClinicAddressState createState() => _ClinicAddressState();
}

class _ClinicAddressState extends State<ClinicAddress> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Clinic",
                            style: TextStyle(
                                color: Color(0xffF5A623),
                                fontSize: 44,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Address 1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 44,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'State ',
                      icon: Icon(
                        Icons.location_city,
                        size: 25.0,
                        color: Color(0xffF5A623),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'City ',
                      icon: Icon(
                        Icons.business,
                        size: 25.0,
                        color: Color(0xffF5A623),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Pincode ',
                      icon: Icon(
                        Icons.label,
                        size: 25.0,
                        color: Color(0xffF5A623),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Home Address',
                      icon: Icon(
                        Icons.home,
                        size: 25.0,
                        color: Color(0xffF5A623),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Exact Location on Map',
                      icon: Icon(
                        Icons.pin_drop,
                        size: 25.0,
                        color: Color(0xffF5A623),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 224.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF5A623),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    alignment: Alignment.center,
                    child: FlatButton(
                        onPressed: null,
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
