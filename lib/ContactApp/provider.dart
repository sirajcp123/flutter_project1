import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/ContactApp/contact_model.dart';

final cprovaider = StateProvider<List<Contact>>((ref) => []);
