import 'package:healthbit/web/patient_model.dart';

class WebState {
  Map<String, PatientModel> allPatients;

  WebState({required this.allPatients});

  WebState copy({required Map<String, PatientModel> allPatients}) {
    return WebState(allPatients: allPatients ?? this.allPatients);
  }

  static WebState initialState() => WebState(
        allPatients: {
          '1900517123123': PatientModel(
              name: 'Popescu Ion',
              age: '31',
              identityNumber: '1900517123123',
              adress: 'str. Daliei nr:15',
              phoneNumber: '0712345678',
              email: 'ionpopescu12345@yahoo.com',
              job: 'Casier',
              workPlace: 'Auchan',
              medicalHistory:
                  'Hipertensiune arteriala esentiala gr. II, Obezitate gr.I',
              alergies: '-',
              cardioConsults: '-')
        },
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebState &&
          runtimeType == other.runtimeType &&
          allPatients == other.allPatients;

  @override
  int get hashCode => allPatients.hashCode;
}
