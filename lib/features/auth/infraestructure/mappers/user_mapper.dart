

import 'package:supabase_riverpod_template/features/auth/domain/domain.dart';

class UserMapper {

  // extraer la lista de propiedades user_metadata

static UserEntity userJsonToEntity( Map<String, dynamic> json) => 
UserEntity(
  id: json['user'].map( (id) => id ), 
  email: json['email'], 
  phone: json['phone'], 
  token: json['token'], 
  createdAt: json['createdAt'], 
  updatedAt: json['updatedAt'], 
  emailConfirmedAt: json['emailConfirmedAt'], 
  phoneConfirmedAt: json['phoneConfirmedAt'], 
  lastSignInAt: json['lastSignInAt']);

}