import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static const String _supabaseUrl = 'https://inuwegazykblvqsncfgh.supabase.co';
  static const String _supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludXdlZ2F6eWtibHZxc25jZmdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk5Mjk5MTMsImV4cCI6MjEwNTUwNTkxM30.LnzP0qN53RGUeahtWfD8_HyBZQpBzzPjVZ1gEIz8fWw';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
