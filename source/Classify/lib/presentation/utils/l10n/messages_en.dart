import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef MessageIfAbsent(String messageStr, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Classify"),
        "exit_dialog_title":
            MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "exit_dialog_message":
            MessageLookupByLibrary.simpleMessage("Do you want to exit an App"),
        "exit_dialog_btn_yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "exit_dialog_btn_no": MessageLookupByLibrary.simpleMessage("No"),
        "error_snack": MessageLookupByLibrary.simpleMessage("Some errors")
      };
}
