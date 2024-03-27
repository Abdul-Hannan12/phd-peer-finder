// ignore_for_file: unnecessary_this

class ResetPasswordBody {
  String? email;

  ResetPasswordBody({
    this.email,
  });

  toJson() => {
        'email': this.email,
      };
}
