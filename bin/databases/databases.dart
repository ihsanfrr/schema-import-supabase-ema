import 'package:supabase/supabase.dart';

part './user_database.dart';
part './sales_database.dart';
part './outlet_database.dart';
part './program_database.dart';
part './warehousestock_database.dart';

SupabaseClient supabase = SupabaseClient(
  'https://xsgwmtxkrfycnzttdpjo.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzZ3dtdHhrcmZ5Y256dHRkcGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2Mjc4NjQsImV4cCI6MTk4NTIwMzg2NH0.4TbTywLCrf4y5EG2BP3v6f8mJHFinkkGoSOxVDSEbZM',
);
SupabaseClient supabaseDev = SupabaseClient(
  'https://kfwaatvsozbuzsztqmvj.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtmd2FhdHZzb3pidXpzenRxbXZqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc2NzA1MDAsImV4cCI6MTk5MzI0NjUwMH0.2qYiYt6L2uUl4TOlSZvN-MU6iERZMAwPR1MXr4pQzss',
);
