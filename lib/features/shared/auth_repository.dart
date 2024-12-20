abstract class AuthRepository {
  // Anmelden mit Google Account
  Future<void> signInWithGoogle();

  Future<void> signOutFromGoogle();

  void setVerificationId(String verificationId);

  // Anmelden mit Mobile Nummer SMS Code Verifizierung
  Future<void> sendVerificationCode(String phoneNumber);

  // Anmelden mit Mobile Nummer
  Future<void> signInWithPhoneNumber(String smsCode);
}
