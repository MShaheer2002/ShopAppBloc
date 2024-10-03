part of 'application_bloc.dart';

@immutable
sealed class ApplicationEvent {
  const ApplicationEvent();
}

class TriggerIndexEvent extends ApplicationEvent {
  const TriggerIndexEvent(this.index);

  final int index;
}
