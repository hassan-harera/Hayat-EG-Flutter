class LoginModel{
late  bool status;
 late String message ;
 userData? data;
LoginModel.fromJason(Map<String,dynamic> json){
 status=json['status'];
 message=json['message'];
 data= json['data'] !=null ? userData.fromJason(json['data']):null;

}
}
class userData{
int? id;
 String? name;
 String ?email;
 String ?phone;
 String ?image;
int ?points;
 int ?credit;
 String? token;
// userData({
//  this.id,
//  this.name,
//  this.email,
//  this.credit,
//  this.image,
//  this.phone,
//  this.points,
//  this.token,
// });
 userData.fromJason(Map<String,dynamic> json){
  id=json['id'];
  name=json['name'];
  email=json['email'];
  credit=json['credit'];
  image=json['image'];
  phone=json['phone'];
  points=json['points'];
  token=json['token'];
 }
}