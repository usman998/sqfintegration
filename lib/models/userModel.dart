


class User{
   int id=0 ;
   late String name ;
   late String email ;
   late String password;

   userMap(){
     var mapping = Map<String , dynamic>();
     mapping['id'] = id;
     mapping['name']= name;
     mapping['email']= email;
     mapping['password'] = password;
     return mapping;
   }
}