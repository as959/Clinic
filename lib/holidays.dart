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
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
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
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              ),
              LabeledCheckbox(
                label: 'Monday',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              ),
              LabeledCheckbox(
                label: 'Tuesday',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              ),
              LabeledCheckbox(
                label: 'Wednesday',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              ),
              LabeledCheckbox(
                label: 'Thrusday',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              ),
              LabeledCheckbox(
                label: 'Friday',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              ),
              LabeledCheckbox(
                label: 'Saturday',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
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
            ]))));
  }
}
