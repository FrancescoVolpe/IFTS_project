class SignupConfirmPut {
  final String email;
  final String pincode; 

  SignupConfirmPut({
    required this.email,
    required this.pincode,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'pincode': pincode,
    };
  }

  @override
  String toString() {
    return 'SignupConfirmPut(email: $email, pincode: $pincode)';
  }
}