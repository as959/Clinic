import 'package:flutter/material.dart';
import 'package:upcloud_clinic/address.dart';
import 'package:upcloud_clinic/holidays.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Color(0xffF5A623),
      ),
      debugShowCheckedModeBanner: false,
      home: ClinicForm(),
    );
  }
}

enum ClinicType { owned, visiting, none }

class ClinicForm extends StatefulWidget {
  @override
  _ClinicFormState createState() => _ClinicFormState();
}

class _ClinicFormState extends State<ClinicForm> {
  ClinicType _character = ClinicType.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Create",
                          style: TextStyle(
                              color: Color(0xffF5A623),
                              fontSize: 44,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 47.0,
                        ),
                        Text(
                          "Clinic",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                              color: Color(0xffF5A623),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                title: const Text('Owned Clinic',
                                    style: TextStyle(fontSize: 10.0)),
                                leading: Radio(
                                  value: ClinicType.owned,
                                  groupValue: _character,
                                  activeColor: Color(0xffF5A623),
                                  onChanged: (ClinicType value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('Visiting Clinic',
                                    style: TextStyle(fontSize: 10.0)),
                                leading: Radio(
                                  value: ClinicType.visiting,
                                  groupValue: _character,
                                  activeColor: Color(0xffF5A623),
                                  onChanged: (ClinicType value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Clinic Name 1',
                            icon: Icon(
                              Icons.person,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),

                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (!(value.length > 2)) {
                              return 'Must contain more than 2 characters';
                            } else if (value.contains("@")) {
                              return 'Do not use @ ';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Clinic Address ',
                            icon: Icon(
                              Icons.home,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Clinic Number 1 ',
                            icon: Icon(
                              Icons.label,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Clinic Services ',
                            icon: Icon(
                              Icons.phone,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Clinic Issues ',
                            icon: Icon(
                              Icons.monetization_on,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Consultation Fees ',
                            icon: Icon(
                              Icons.access_time,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Holiday's",
                            icon: Icon(
                              Icons.access_time,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Avg Pt. per/day",
                            icon: Icon(
                              Icons.access_time,
                              size: 25.0,
                              color: Color(0xffF5A623),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Do you have another Clinic?",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Yes',
                                  style: TextStyle(fontSize: 10.0)),
                              leading: Radio(
                                value: ClinicType.owned,
                                groupValue: _character,
                                activeColor: Color(0xffF5A623),
                                onChanged: (ClinicType value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('No',
                                  style: TextStyle(fontSize: 10.0)),
                              leading: Radio(
                                value: ClinicType.visiting,
                                groupValue: _character,
                                activeColor: Color(0xffF5A623),
                                onChanged: (ClinicType value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffF5A623),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              alignment: Alignment.center,
                              child: FlatButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClinicHolidays()),
                                      ),
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
                      ])))),
    );
  }
}
