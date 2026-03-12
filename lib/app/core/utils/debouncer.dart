import 'dart:async';

/// A utility class to delay the execution of an action.
///
/// Debouncer is useful for cases such as:
/// - search input in a TextField
/// - filtering data
/// - sending API requests while the user is typing
///
/// How it works:
/// every time [run] is called, the previous timer is canceled,
/// then a new timer is started.
/// The action will only be executed if there are no new calls
/// until the duration in [milliseconds] has passed.
///
/// Example:
/// if the duration is 500 ms and the user keeps typing,
/// the action will only run once after the user stops typing
/// for 500 ms.
///
/// Important:
/// call [dispose] when the controller or widget is closed
/// to cancel any active timer.
class Debouncer {
  /// Creates a debouncer with the given delay duration in milliseconds.
  Debouncer({required this.milliseconds});

  /// The delay duration before the action is executed.
  final int milliseconds;

  Timer? _timer;

  /// Runs the given [action] with debounce behavior.
  ///
  /// If there is an active timer, it will be canceled
  /// and replaced with a new one.
  ///
  /// This is useful to prevent an action from being called too often,
  /// for example when the user is typing in a search field.
  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Cancels the active timer if it exists.
  ///
  /// This should be called inside `onClose()` in a GetxController
  /// or `dispose()` in a StatefulWidget.
  void dispose() {
    _timer?.cancel();
  }
}
