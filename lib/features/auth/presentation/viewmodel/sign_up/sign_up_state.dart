class SignUpState {
  final String email;
  final String username;
  final String? userNameError;
  final String? emailError;

  const SignUpState({
    this.email = '',
    this.username = '',
    this.userNameError,
    this.emailError,
  });

  SignUpState copyWith({
    String? email,
    String? username,
    String? userNameError,
    String? emailError,
  }) {
    return SignUpState(
      email: email ?? this.email,
      username: username ?? this.username,
      userNameError: userNameError,
      emailError: emailError,
    );
  }
}