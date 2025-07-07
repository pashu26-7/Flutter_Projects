
// class SessionData {
// static bool? isLogin;
// static String? emailId;
// static Future<void> storeSessionData(
// {required bool loginData, required String emailId}) async {
// SharedPreferences sharedPreferences = await
// SharedPreferences.getInstance();
// // SET DATA
// sharedPreferences.setBool("loginSession", loginData);
// sharedPreferences.setString("email", emailId);

// // GET DATA
// getSessionData();
// }
// static Future<void> getSessionData() async {
// SharedPreferences sharedPreferences = await
// SharedPreferences.getInstance();
// isLogin = sharedPreferences.getBool("loginSession") ?? false;
// emailId = sharedPreferences.getString("email") ?? "";
// }
// }


// /// SHARED PREFERENCE - Store Data
// await SessionData.storeSessionData(
// loginData: true,
// emailId: userCredentials.user!.email!,
// );