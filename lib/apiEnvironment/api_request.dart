
import '../utils/aapString.dart';
import '../utils/sharePerf.dart';
import 'api_service.dart';
import 'api_url.dart';

/*
class ApiRequest {
  final ApiService _apiService = ApiService();

  var token = SharedPref.getUserDataString(variableName: AppStrings.authToken);

  Future<Response?> getRegister(
    String? title,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    dynamic phone,
  ) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.register,
        data: {
          "title": title,
          "first_name": firstName,
          "middle_name": middleName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "user_type": 'PATIENT',
          "device_type": 'ANDROID',
          "device_token": '12',
        },
*/
/*options: Options(
              headers: Utils.getHeaders()
          )*//*
*/
/*

      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getLogin(String? phone) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.login,
        data: {
          "user_name": phone,
          "device_token": '12',
        },
        *//*

*/
/*options: Options(
              headers: Utils.getHeaders()
          )*//*
*/
/*

      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getVerifyOtp(String? phone, int? otp) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.verifyOtp,
        data: {
          "phone": phone,
          "otp": otp,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getResendOtp(String? phone) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.resendOtp,
        data: {
          "phone": phone,
          // "user_type": 'PATIENT',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUpdateProfile(
    String? title,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    dynamic phone,
    String? gender,
    String? dob,
    String? image,
  ) async {
    try {
      final Response response = await _apiService.put(
        ApiUrl.updateProfile,
        data: {
          "user_type": 'PATIENT',
          "title": title,
          "first_name": firstName,
          "middle_name": middleName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "gender": gender,
          "date_of_birth": dob,
          "image": image,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// doctor list get api data
  Future<Response?> getDoctorList(
      int? page, int length, String? searchCtl) async {
    try {
      final Response? response = await _apiService.get(
        ApiUrl.allDoctor,
        queryParameters: {
          "page": page,
          "page_size": length,
          "search": "$searchCtl"
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// doctor detail page api data
  Future<Response?> getDoctorDetail(String? doctorId) async {
    try {
      final Response? response = await _apiService.get(
        ApiUrl.doctorDetails,
        queryParameters: {
          "doctor_id": doctorId,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// hospital list get api data
  Future<Response?> getHospitalList(
      int? page, int length, String? searchCtl) async {
    try {
      final Response? response = await _apiService.get(
        ApiUrl.allHospital,
        queryParameters: {
          "page": page,
          "page_size": length,
          "search": "$searchCtl"
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// doctor detail page api data
  Future<Response?> getHospitalDetail(
      String? doctorId, String? userType) async {
    try {
      final Response? response = await _apiService.get(
        userType == AppStrings.hospitals
            ? ApiUrl.hospitalDetails
            : ApiUrl.diagnosticDetails,
        queryParameters: userType == AppStrings.hospitals
            ? {
                "hospital_id": doctorId,
              }
            : {
                "diagnostic_id": doctorId,
              },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// rating  for hospital
  Future<Response?> addRatingHospital(
      {dynamic? rating,
      String? review,
      String? hospitalId,
      String? userType}) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.addRating,
        data: userType == "HOSPITAL"
            ? {
                "rating": rating,
                "type": AppStrings.hospitals,
                "hospital_id": hospitalId,
                "review": review,
              }
            : {
                "rating": rating,
                "type": AppStrings.diagnostic,
                "diagnostic_id": hospitalId,
                "review": review,
              },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// rating  for doctor
  Future<Response?> addRatingDoctor(
      {int? rating, String? review, String? doctorId}) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.addRating,
        data: {
          "rating": rating,
          "type": "DOCTOR",
          "doctor_id": doctorId,
          "review": review,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getProfileDetail() async {
    try {
      final Response? response = await _apiService.get(
        ApiUrl.getProfile,
        queryParameters: {
          "user_type": 'PATIENT',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getHomeDetails(String? search) async {
    try {
      final Response? response = await _apiService.get(
        ApiUrl.getHomeDetails,
        queryParameters: {
          "search": search,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// get doctorProfile api ----------
  Future<Response?> getDoctorProfile(String? userType) async {
    try {
      final Response? response = await _apiService.get(
        ApiUrl.getProfile,
        queryParameters: {
          "user_type": userType,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// cms pages api --------------------------

  Future<Response?> getCmsPages(String? type) async {
    try {
      final Response? response = await _apiService
          .get(ApiUrl.cmsPages, queryParameters: {"type": type});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getSpecialtyByUser(String? id) async {
    try {
      final Response? response = await _apiService
          .get(ApiUrl.getSpecialtyByUser, queryParameters: {"id": id});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getDiseaseByUser(
    String? id,
    int? page,
  ) async {
    try {
      final Response? response = await _apiService.get(ApiUrl.getDiseaseByUser,
          queryParameters: {"id": id, "page": page});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// update profilefor dhd
  Future<Response> getUpdateProfileD({
    String? name,
    String? title,
    String? firstName,
    String? middleName,
    String? lastName,
    String? userType,
    String? email,
    dynamic? phone,
    String? gender,
    String? dob,
    String? image,
    String? address,
    String? address1,
    String? area,
    String? city,
    String? state,
    num? pinCode,
    String? hospitalType,
    String? dpid,
    String? regd_no_mrc,
    int? nabc,
    List<String>? qualification,
    String? experience,
    int? bloodBank,
    List<String>? specialty,
    List<String>? treatment,
    List<String>? disease,
    List<String>? services,
    List<String>? facilities,
    List<String>? doctorsList,
    List<String>? facilitiesDiagnostic,
    List<String>? medicalTestDiagnostic,
    String? about,
  }) async {
    try {
      final Response response = await _apiService.put(ApiUrl.updateProfile,
          data: userType == "DOCTOR"
              ? {
                  "user_type": userType,
                  "title": title,
                  "first_name": firstName,
                  "middle_name": middleName,
                  "last_name": lastName,
                  "email": email,
                  "phone": phone,
                  "gender": gender,
                  "date_of_birth": dob,
                  "image": image,
                  "address": address,
                  "address1": address1,
                  "area": area,
                  "city": city,
                  "state": state,
                  "pincode": pinCode,
                  "dpid": dpid,
                  "regd_no_mrc": regd_no_mrc,
                  "specialty_ids": specialty,
                  "treatment_ids": treatment,
                  "diseases_ids": disease,
                  "experience": experience,
                  "qualification_ids": qualification,
                  "about": about,
                }
              : userType == "HOSPITAL"
                  ? {
                      "user_type": userType,
                      'name': name,
                      "email": email,
                      "phone": phone,
                      "image": image,
                      "address": address,
                      "address1": address1,
                      "area": area,
                      "city": city,
                      "state": state,
                      "pincode": pinCode,
                      "experience": experience,
                      //"qualification": hospitalType,
                      "nabc": nabc == 1 ? true : false,
                      "blood_bank_available": bloodBank == 1 ? true : false,
                      "services_ids": services,
                      "facilities_ids": facilities,
                      "doctors_ids": doctorsList,
                      "about": about,
                    }
                  : {
                      "user_type": userType,
                      'name': name,
                      "email": email,
                      "phone": phone,
                      "image": image,
                      "address": address,
                      "address1": address1,
                      "area": area,
                      "city": city,
                      "state": state,
                      "pincode": pinCode,
                      "nabc": nabc == 1 ? true : false,
                      "medical_test_ids": medicalTestDiagnostic,
                      "facilities_ids": facilitiesDiagnostic,
                      "about": about,
                    });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> addContactInfo(
      {String? id,
      String? name,
      String? email,
      String? phone,
      String? type,
      *//*

*/
/* String? dayOfWeek,
    String? startTime,
    String? endTime,*//*
*/
/*

      List? working}) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.contactInfo,
        data: {
          "id": id,
          "name": name,
          "email": email,
          "phone": phone,
          "type": type,
          *//*

*/
/*"day_of_week": dayOfWeek,
          "start_time": startTime,
          "end_time": endTime,*//*
*/
/*

          "working_hours": working
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getTreatmentByDoctor(
    List<String>? specialty_id,
  ) async {
    try {
      final Response? response = await _apiService.post(
        ApiUrl.getTreatment,
        data: {
          "specialty_ids": specialty_id,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> getNotification(int? page, int? pageSize) async {
    try {
      final Response? response =
          await _apiService.get(ApiUrl.notifications, queryParameters: {
        "page": page,
        "page_size": pageSize,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
*//*

*/
/*String? dayOfWeek,
    String? endTime,
*//*
*/
/*


*//*

*/
/* Map<String, dynamic> tokenMap = {"access_token": token};
     Utils.printLog("token found $tokenMap");
     Utils.printLog("url  found ${ApiUrl.stagingBaseUrl + name + ApiUrl.getSliders}");
     try {
       final Response response = await _apiService.post(
         ApiUrl.stagingBaseUrl + name + ApiUrl.getSliders,
         data: paramRandom,
         options: Options(
           headers: Utils.getHeadersWithToken(
             tokenMap,
           ),
         ),
       );
       return response;
     } catch (e) {
       rethrow;
     }*//*
*/
/*


/// **    register api
*//*

*/
/*  Future<Response> getRegister(String email, String phone, String firstname, String password, String referral) async {
     try {
       final Response response = await _apiService.postMultipart(
         ApiUrl.newuser,
         data: RegisterRequest(
           country_mobile_code: "+91",
           email: email,
           firstname: firstname,
           password: password,
           phone: phone,
           referral_code: referral,
         ).toJson(),
         options: Options(
           headers: Utils.getHeadersMultiPart(),
         ),
       );

       return response;
     } catch (e) {
       rethrow;
     }
   }*//*
*/
/*


*//*

*/
/*Future<Response> getHtml(String url) async {
     try {
       final Response response = await _apiService.get(url);
       return response;
     } catch (e) {
       rethrow;
     }
   }*//*
*/
/*

*/
