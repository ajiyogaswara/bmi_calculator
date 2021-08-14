import 'package:bmi_calculator/domain/model/gender_data_model.dart';

class ResultDataModel {
  final GenderDataModel genderDataModel;
  final double age;
  final double height;
  final double weight;

  const ResultDataModel(
      {required this.age,
      required this.genderDataModel,
      required this.height,
      required this.weight});
}
