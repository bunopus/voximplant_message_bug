VoxImplant onMessageReceived bug sample project

# Steps to reproduce
1. Following [the doc](https://voximplant.com/docs/tutorials/recording/video-recording) create simple scenario on VoxImplant platform
2. Add this code into scenario

        VoxEngine.addEventListener(AppEvents.CallAlerting, (e) => {
          e.call.addEventListener(CallEvents.Connected, handleCallConnected);
          e.call.addEventListener(CallEvents.RecordStarted, handleRecordStarted);
          e.call.addEventListener(CallEvents.Failed, VoxEngine.terminate);
          e.call.addEventListener(CallEvents.Disconnected, VoxEngine.terminate);
          e.call.answer();
        });

        function handleCallConnected(e) {
          e.call.sendMessage("test message");
        }
2. `git clone git@github.com:bunopus/voximplant_message_bug.git`
3. Run your favorite emulator with `flutter emulators --launch`
4. Change `USERNAME` and `PASSWORD` to actual in `/lib/main.dart`
5. `flutter run`
6. Press big blue button. Et voila! 
7. 
        Unhandled Exception: type 'Null' is not a subtype of type 'String'
        package:flutter_voximplant/…/call/call.dart:577