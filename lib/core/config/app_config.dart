class AppConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://qjnsujqgbqjijsrhwzat.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
      'SUPABASE_ANON_KEY',
      defaultValue:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFqbnN1anFnYnFqaWpzcmh3emF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc0NTI3ODIsImV4cCI6MjA1MzAyODc4Mn0.59aeje1YGKLCbxAL3U7JQTzEpsRm5D-Vz0rdeWElWI0');
}
