import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart/cubit_state.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_service.dart';

//fetch the data
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherService}) : super(WeatherInitial());
  WeatherService weatherService;
  String? cityNameCubit;
  WeatherModel? weatherModel;
  getWeatherCubit({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
