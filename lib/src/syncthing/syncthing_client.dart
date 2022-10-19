//file name fficheck.dart
import 'dart:ffi' as ffi; // For FFI
import 'package:ffi/ffi.dart';
import 'package:ffi/src/utf8.dart';
import 'package:path/path.dart';

typedef get_device_id_func = ffi.Pointer<Utf8> Function(); // FFI fn signature
typedef GetDeviceId = ffi.Pointer<Utf8> Function(); // Dart fn signature
final dylib =
    ffi.DynamicLibrary.open(absolute('lib/src/syncthing/syncthing.a'));

final GetDeviceId getDeviceId = dylib
    .lookup<ffi.NativeFunction<get_device_id_func>>('GetDeviceId')
    .asFunction();

class SyncthingClient {
  static SyncthingClient? _instance;
  String _deviceId = "";

  SyncthingClient._() {
    // initialize syncthing
    _deviceId = getDeviceId().toDartString();
  }

  Future<void> initialize() async {
    return;
  }

  Future<String> deviceId() async => _deviceId;

  static Future<SyncthingClient> instance() async {
    if (_instance != null) {
      return Future.value(_instance);
    }
    _instance = SyncthingClient._();
    await _instance?.initialize();
    return Future.value(_instance);
  }
}
