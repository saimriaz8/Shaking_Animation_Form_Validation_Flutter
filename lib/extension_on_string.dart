extension StringValidation on String? {
  bool isValidEmail() {
    if (this != null) {
      return this!.contains('@gmail.com') ||
          this!.contains('@hotmail.com') ||
          this!.contains('@outlook.com') ||
          this!.contains('@yahoo.com');
    }
    return false;
  }

   bool isValidPhoneNumber() {
    return isDigitString() && this?.length == 11;
  }

   bool isDigitString() {
    return this?.codeUnits.every(
              (element) => element >= 48 && element <= 57,
            ) ??
        false;
  }
}