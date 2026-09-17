import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

/// Handles uploading product photos to Firebase Storage and returns
/// the public download URL to save alongside the product in Firestore.
class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Uuid _uuid = const Uuid();

  /// Uploads raw image bytes (works for both web & mobile picks) and
  /// returns the download URL.
  ///
  /// The actual image format (JPEG / PNG / GIF / WEBP) is detected from
  /// the file's own byte signature rather than assumed, so the stored
  /// content-type and extension always match what was really picked -
  /// image_picker's gallery source can return any of these formats.
  Future<String> uploadProductImage(Uint8List bytes, {String? fileName}) async {
    final detected = _detectImageType(bytes);
    final name = fileName ?? '${_uuid.v4()}.${detected.extension}';
    final ref = _storage.ref().child('product_images/$name');
    final uploadTask = await ref.putData(
      bytes,
      SettableMetadata(contentType: detected.mimeType),
    );
    return await uploadTask.ref.getDownloadURL();
  }

  /// Deletes an image from storage given its full download URL.
  Future<void> deleteImageByUrl(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (_) {
      // Ignore if already deleted or URL isn't a storage ref.
    }
  }

  /// Inspects the magic bytes at the start of the file to determine its
  /// real image format. Falls back to JPEG if the signature isn't
  /// recognized (still safe - browsers sniff actual bytes anyway).
  _ImageType _detectImageType(Uint8List bytes) {
    if (bytes.length >= 8 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47) {
      return const _ImageType('image/png', 'png');
    }
    if (bytes.length >= 3 &&
        bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[2] == 0xFF) {
      return const _ImageType('image/jpeg', 'jpg');
    }
    if (bytes.length >= 6 &&
        bytes[0] == 0x47 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46) {
      return const _ImageType('image/gif', 'gif');
    }
    if (bytes.length >= 12 &&
        bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50) {
      return const _ImageType('image/webp', 'webp');
    }
    // Unknown signature - default to JPEG.
    return const _ImageType('image/jpeg', 'jpg');
  }
}

class _ImageType {
  final String mimeType;
  final String extension;
  const _ImageType(this.mimeType, this.extension);
}
