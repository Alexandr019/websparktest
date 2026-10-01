import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:websparktest/core/utils/url_validator.dart';
import 'package:websparktest/features/shortest_path/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  int _requestId = 0;

  void onUrlChanged(String url) {
    emit(HomeInitial(url));
  }

  void onSubmitted() {
    final error = UrlValidator.validate(state.url);
    if (error != null) {
      emit(FailureHomeState(state.url, error));
      return;
    }

    emit(SuccessHomeState(state.url, ++_requestId));
  }
}
