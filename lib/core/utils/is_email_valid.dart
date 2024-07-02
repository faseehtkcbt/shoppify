bool isEmailValid(String email) {
  // Simple email validation using a regular expression
  // Modify the regular expression pattern as per your requirements
  const emailRegex =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  final regExp = RegExp(emailRegex);
  return regExp.hasMatch(email);
}
