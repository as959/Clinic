import 'package:flutter/material.dart';
import 'package:upcloud_clinic/address.dart';
import 'package:upcloud_clinic/holidays.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Color(0xffF5A623),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> numForms = List();
  _MyAppState() {
    print("Started");
  }

  void addForm(int choice) {
    setState(() {
      if (choice == 1) {
        numForms.add(MyForm(addForm));
      } else {
        numForms.removeLast();
      }
    });
  }

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
                StartForm(addForm),
                for (var item in numForms) item,
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
        ));
  }
}

class StartForm extends StatefulWidget {
  var numForm;
  StartForm(numForm) {
    this.numForm = numForm;
  }
  @override
  _StartFormState createState() => _StartFormState(numForm);
}

int startedForm = 0;

class _StartFormState extends State<StartForm> {
  List<String> clinicType = List();
  var numForm;

  String _character = 'none';
  _StartFormState(numForm) {
    print("In startForm");
    this.clinicType = ['owned', 'visiting', 'none'];
    this.numForm = numForm;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('Owned Clinic', style: TextStyle(fontSize: 10.0)),
            leading: Radio(
              value: clinicType[0],
              groupValue: _character,
              activeColor: Color(0xffF5A623),
              onChanged: (String value) {
                setState(() {
                  _character = value;
                  if (startedForm == 0) {
                    startedForm = 1;
                    numForm(1);

                    print("startedForm val$startedForm");
                  }
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
              value: clinicType[1],
              groupValue: _character,
              activeColor: Color(0xffF5A623),
              onChanged: (String value) {
                setState(() {
                  _character = value;
                  if (startedForm == 0) {
                    startedForm = 1;
                    numForm(1);

                    print("startedForm val$startedForm");
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyForm extends StatefulWidget {
  var numForm;
  MyForm(numF) {
    this.numForm = numF;
  }
  @override
  _MyFormState createState() => _MyFormState(numForm);
}

class _MyFormState extends State<MyForm> {
  var _formKey;
  var numForm;
  List<String> addForm;
  String _nclinic;
  int f;
  var stateCode = {
    'Mobile': '+91',
    'Delhi': '011',
    'Mumbai': '022',
    'Chennai': '044',
    'Hyderabad': '040'
  };
  String dropdownstate;
  _MyFormState(numForm) {
    this.addForm = ['yes', 'no'];
    this._nclinic = 'no';
    this._formKey = GlobalKey<FormState>();
    this.numForm = numForm;
    this.f = startedForm;
    this.dropdownstate = 'Mobile';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          f == 1 ? SizedBox() : StartForm(numForm),
          TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
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
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Clinic Address ',
                    icon: Icon(
                      Icons.home,
                      color: Color(0xffF5A623),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffF5A623),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClinicAddress()),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: InputBorder.none,
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
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Clinic Issues ',
                icon: SvgPicture.asset(
                  "assets/noun_Rupee_1060217.svg",
                  height: 30.0,
                  width: 30.0,
                )),
          ),
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Consultation Fees ',
              icon: Icon(
                Icons.access_time,
                color: Color(0xffF5A623),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Holiday's",
                    icon: Icon(
                      Icons.calendar_today,
                      color: Color(0xffF5A623),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffF5A623),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClinicHolidays()),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Avg Pt. per/day",
              icon: Icon(
                Icons.access_time,
                color: Color(0xffF5A623),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[600],
            height: 2,
            thickness: 1,
          ),
          Column(
            children: <Widget>[
              ListTile(
                title:
                    const Text('Add Clinic?', style: TextStyle(fontSize: 10.0)),
                leading: Radio(
                  value: addForm[0],
                  groupValue: _nclinic,
                  activeColor: Color(0xffF5A623),
                  onChanged: (String value) {
                    setState(() {
                      _nclinic = value;
                      if (startedForm == 1) {
                        startedForm = 2;
                      }
                      print(">>startedForm val$startedForm");
                      numForm(1);
                      print(">>>startedForm val$startedForm");
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No', style: TextStyle(fontSize: 10.0)),
                leading: Radio(
                  value: addForm[1],
                  groupValue: _nclinic,
                  activeColor: Color(0xffF5A623),
                  onChanged: (String value) {
                    setState(() {
                      _nclinic = value;
                      if (startedForm == 1) {
                        startedForm = 2;
                      }
                      print(">>startedForm val$startedForm");
                      numForm(-1);
                      print(">>>startedForm val$startedForm");
                    });
                  },
                ),
              ),
              Divider(
                color: Colors.grey[600],
                height: 2,
                thickness: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
