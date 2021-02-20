import 'package:flutter/material.dart';
import 'package:upcloud_clinic/address.dart';
import 'package:upcloud_clinic/holidays.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class ClinicForm extends StatefulWidget {
  @override
  _ClinicFormState createState() => _ClinicFormState();
}

class _ClinicFormState extends State<ClinicForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            color: Colors.black,
            padding: EdgeInsets.all(20),
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
                    //////
                    ///
                    ///
                    RadioAddClinic(),
                    MyForm(),
                    // startForm == 1 ? MyForm() : Container(),
                    // for (var item in numForms) item,

                    ////
                    ///
                    ///
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF5A623),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
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
                  ]),
            )));
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

enum ClinicType { owned, visiting, none }
enum AddClinic { yes, no }
int startForm = 0;
List<Widget> numForms = new List();

class _MyFormState extends State<MyForm> {
  TextEditingController name = TextEditingController();
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  var stateCode = {
    'Mobile': '+91',
    'Delhi': '011',
    'Mumbai': '022',
    'Chennai': '044',
    'Hyderabad': '040'
  };
  AddClinic _nclinic = AddClinic.no;
  String dropdownstate = 'Mobile';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              labelText: 'Clinic Name 1',
              icon: Icon(
                Icons.person,
                size: 25.0,
                color: Color(0xffF5A623),
              ),
            ),
            validator: (value) {
              if (value.length < 2) {
                return 'Must contain more than 2 characters';
              } else if (value.contains("@")) {
                return 'Do not use @ ';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Clinic Address ',
                icon: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Color(0xffF5A623),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClinicAddress()),
                  ),
                )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: number1,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefix: Text(stateCode[dropdownstate]),
                    labelText: 'Clinic No. 1 ',
                    icon: Icon(
                      Icons.label,
                      size: 25.0,
                      color: Color(0xffF5A623),
                    ),
                  ),
                  validator: (value) {
                    if (stateCode[dropdownstate] == "Mobile") {
                      if (value.length != 10)
                        return 'Please Enter 10 digit number';
                      else
                        return null;
                    } else {
                      if (value.length != 8)
                        return 'Please enter 8 digit number';

                      return null;
                    }
                  },
                ),
              ),
              DropdownButton<String>(
                value: dropdownstate,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 25.0,
                style: TextStyle(color: Colors.white),
                underline: Container(
                  height: 0,
                  color: Colors.grey[600],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownstate = newValue;
                  });
                },
                items: <String>[
                  'Mobile',
                  'Delhi',
                  'Mumbai',
                  'Chennai',
                  'Hyderabad'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          TextFormField(
            controller: number2,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Clinic Services ',
              icon: Icon(
                Icons.phone,
                size: 25.0,
                color: Color(0xffF5A623),
              ),
            ),
            validator: (value) {
              if (value.length != 10)
                return 'Please Enter 10 digit number';
              else
                return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Clinic Issues ',
                icon: SvgPicture.asset(
                  "assets/noun_Rupee_1060217.svg",
                  height: 30.0,
                  width: 30.0,
                )),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Consultation Fees ',
              icon: Icon(
                Icons.access_time,
                color: Color(0xffF5A623),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Holiday's",
                icon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Color(0xffF5A623),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClinicHolidays()),
                  ),
                )),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Avg Pt. per/day",
              icon: Icon(
                Icons.access_time,
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
                title: const Text('Yes', style: TextStyle(fontSize: 10.0)),
                leading: Radio(
                  value: AddClinic.yes,
                  groupValue: _nclinic,
                  activeColor: Color(0xffF5A623),
                  onChanged: (AddClinic value) {
                    setState(() {
                      numForms.add(MyForm());
                      _nclinic = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No', style: TextStyle(fontSize: 10.0)),
                leading: Radio(
                  value: AddClinic.no,
                  groupValue: _nclinic,
                  activeColor: Color(0xffF5A623),
                  onChanged: (AddClinic value) {
                    setState(() {
                      _nclinic = value;
                    });
                    if (_formKey.currentState.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ]));
  }
}

class RadioAddClinic extends StatefulWidget {
  @override
  _RadioAddClinicState createState() => _RadioAddClinicState();
}

class _RadioAddClinicState extends State<RadioAddClinic> {
  ClinicType _character = ClinicType.none;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('Owned Clinic', style: TextStyle(fontSize: 10.0)),
            leading: Radio(
              value: ClinicType.owned,
              groupValue: _character,
              activeColor: Color(0xffF5A623),
              onChanged: (ClinicType value) {
                setState(() {
                  _character = value;
                  startForm = startForm + 1;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title:
                const Text('Visiting Clinic', style: TextStyle(fontSize: 10.0)),
            leading: Radio(
              value: ClinicType.visiting,
              groupValue: _character,
              activeColor: Color(0xffF5A623),
              onChanged: (ClinicType value) {
                setState(() {
                  _character = value;
                  startForm = startForm + 1;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
