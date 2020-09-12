extension StringExtension on String{

  bool isEmailValid(){
    final RegExp regex = RegExp(
      r'/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/'
    );
//    return regex.hasMatch(this);
  return this.contains("@") && this.contains(".com");
  }

}