import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox(
      {this.label,
      this.padding,
      this.value,
      this.onChanged,
      this.checkColor,
      this.activeColor});

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;
  final Color checkColor;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              activeColor: Colors.white,
              checkColor: Colors.black,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ClinicHolidays extends StatefulWidget {
  @override
  _ClinicHolidaysState createState() => _ClinicHolidaysState();
}

class _ClinicHolidaysState extends State<ClinicHolidays> {
  Map<String, bool> holidays = {
    'sun': false,
    'mon': false,
    'tue': false,
    'wed': false,
    'thru': false,
    'fri': false,
    'sat': false,
  };
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
                  child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      "Holidays",
                      style: TextStyle(
                          color: Color(0xffF5A623),
                          fontSize: 44,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                LabeledCheckbox(
                  label: 'Sunday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['sun'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['sun'] = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Monday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['mon'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['mon'] = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Tuesday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['tue'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['tue'] = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Wednesday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['wed'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['wed'] = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Thrusday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['thru'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['thru'] = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Friday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['fri'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['fri'] = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Saturday',
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  value: holidays['sat'],
                  onChanged: (bool newValue) {
                    setState(() {
                      holidays['sat'] = newValue;
                    });
                  },
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
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClinicHolidays()),
                          ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500),
                      )),
                )
              ]))),
        ));
  }
}
