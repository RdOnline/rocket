import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket/rocketModel.dart';
import 'package:rocket/services.dart';

final rocketDataProvider = FutureProvider<List<RocketModel>>((ref) async{
  return ref.watch(rocketProvider).getRockets();

});