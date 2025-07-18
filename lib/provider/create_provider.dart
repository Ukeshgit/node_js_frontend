import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/controller/apihelper.dart';
import 'package:nodejs_tut/model/create_model.dart';

final productPostProvider = Provider<Apihelper>((ref) => Apihelper());
