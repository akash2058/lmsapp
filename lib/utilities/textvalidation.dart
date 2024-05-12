String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'email required';
  }

  // Use a regex to validate the email format
  // String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  // RegExp regex = RegExp(emailPattern);

  // if (!regex.hasMatch(value)) {
  //   return 'Please enter a valid email address';
  // }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'password required';
  }

  // if (value.length < 8) {
  //   return 'Password must be at least 8 characters long';
  // }

  return null;
}

String? validateotp(String? value) {
  if (value == null || value.isEmpty) {
    return 'otp required';
  }

  // if (value.length < 8) {
  //   return 'Password must be at least 8 characters long';
  // }

  return null;
}

String? validaterepeatPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'repeat password required';
  }

  // if (value.length < 8) {
  //   return 'Password must be at least 8 characters long';
  // }

  return null;
}

String? validatename(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name required';
  }

  return null;
}
