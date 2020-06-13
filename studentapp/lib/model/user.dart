class Student {
  String id;
  String fullname;
  String address;
  String clas;
  String school;
  String password;
  String role;

 Student({this.id, this.fullname, this.address,this.clas,this.school,this.password,this.role});

  Student.fromMap(Map snapshot,String id) :
        id = id ?? '',
        fullname = snapshot['fullname'] ?? '',
        address = snapshot['address'] ?? '',
        clas = snapshot['class'] ?? '',
        school = snapshot['school']??'',
        password=snapshot['password']??'',
        role=snapshot['role']??'';
        

  toJson() {
    return {
      "fullname": fullname,
      "address": address,
      "class_": clas,
      "school":school,
      "password":password,
      "role":role
    };
  }
}