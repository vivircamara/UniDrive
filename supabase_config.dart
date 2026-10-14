import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  
  static const String supabaseUrl = 'https://jiocfmvjrngjwgfnvbyu.supabase.co';
  static const String supabaseAnonKey = 'sb_publishable_EmRejNbiI6W8ujvPwd5Yog_Fz3P10hL';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }
}
