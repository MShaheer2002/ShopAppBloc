part of 'application_bloc.dart';

class ApplicationState {
  int index;

  ApplicationState({this.index = 0});

  ApplicationState copyWith({int? index}) {
    return ApplicationState(index: index ?? this.index);
  }
}
