import 'package:bmi_calculator/domain/model/gender_data_model.dart';
import 'package:bmi_calculator/domain/model/result_data_model.dart';
import 'package:bmi_calculator/presentation/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/age_and_weight_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double currentValue = 100;
  double weightCount = 0;
  double ageCount = 0;
  int _option = 0;

  List<GenderDataModel> genderDataModel = <GenderDataModel>[];

  void fillDataToList() {
    genderDataModel.add(GenderDataModel(
        isSelected: true, label: "FEMALE", image: 'assets/icons/female.svg'));
    genderDataModel.add(GenderDataModel(
        isSelected: false, label: "MALE", image: 'assets/icons/male.svg'));
  }

  @override
  void initState() {
    // Fill data gender to list genderDataModel
    fillDataToList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color(0xff12163A),
      ),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: genderDataModel.map(
                  (gender) {
                    return Expanded(
                      child: InkWell(
                        onTap: () {
                          // Rubah semua status menjadi false
                          genderDataModel.forEach((element) {
                            element.isSelected = false;
                          });
                          // rubah status yang di pilih menjadi true
                          gender.isSelected = true;

                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          decoration: BoxDecoration(
                              color: (gender.isSelected)
                                  ? Color(0xff272A4D)
                                  : Color(0xff48495B),
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                gender.image,
                                height: 80,
                                color: (gender.isSelected == true)
                                    ? Colors.pink
                                    : Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(gender.label,
                                  style: TextStyle(
                                    color: (gender.isSelected == true)
                                        ? Colors.pink
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            heightContainer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 220,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AgeAndWeightWidget(
                    defaultValue: 40,
                    title: "WEIGHt",
                    newValue: (val) {
                      weightCount = val;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AgeAndWeightWidget(
                    defaultValue: 80,
                    title: "AGE",
                    newValue: (val) {
                      ageCount = val;
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                splashColor: Colors.pink[200],
                hoverColor: Colors.green,
                minWidth: 150,
                onPressed: () {
                  print(currentValue);
                  final _currentGender = genderDataModel
                      .firstWhere((gender) => gender.isSelected == true);
                  final _height = currentValue;
                  final _weight = weightCount;
                  final _age = ageCount;
                  // membuat data model / mengumpulkan semua data menjadi 1 model
                  final _result = ResultDataModel(
                    age: _age,
                    genderDataModel: _currentGender,
                    height: _height,
                    weight: _weight,
                  );
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(
                            resultDataModel: _result,
                          )));
                  // print("Height :" + currentValue.toStringAsFixed(0));
                  // print("Weight:" + weightCount.toStringAsFixed(0));
                  // print("Age :" + ageCount.toStringAsFixed(0));
                },
                color: Colors.pink,
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                height: 60,
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            )
          ])),
    );
  }

  Container heightContainer() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xff232849),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "HEIGHT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currentValue.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text("cm",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
            Slider(
              value: currentValue,
              onChanged: (double val) {
                print(val);
                setState(() {
                  currentValue = val;
                });
              },
              min: 0,
              max: 300,
              label: currentValue.toStringAsFixed(0),
              activeColor: Colors.white,
              inactiveColor: Colors.pink,
            ),
          ],
        ));
  }
}
