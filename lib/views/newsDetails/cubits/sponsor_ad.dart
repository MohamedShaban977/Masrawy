import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/views/newsDetails/states/sponsor_ad.dart';
import '';
class SponsorAdCubit extends Cubit<SponsorAdState> {
  SponsorAdCubit() : super(SponsorAdInitial());

  static SponsorAdCubit get(context)=> BlocProvider.of(context);

  void rebuild()=> emit(SponsorAdInitial());
}
