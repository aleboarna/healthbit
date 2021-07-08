class PatientModel {
  String name;
  String age;
  String identityNumber;
  String adress;
  String phoneNumber;
  String email;
  String job;
  String workPlace;
  String medicalHistory;
  String alergies;
  String cardioConsults;

  PatientModel(
      {required this.name,
      required this.age,
      required this.identityNumber,
      required this.adress,
      required this.phoneNumber,
      required this.email,
      required this.job,
      required this.workPlace,
      required this.medicalHistory,
      required this.alergies,
      required this.cardioConsults});
}
