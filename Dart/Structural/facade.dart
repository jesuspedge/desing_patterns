/// Complex Classes for a mock video framework
class VideoFile {
  VideoFile({required this.name});

  final String name;
}

abstract interface class CompresionCodec {}

class OggCompresionCodec implements CompresionCodec {}

class MPEG4CompressionCodec implements CompresionCodec {}

class CodecFactory {
  CompresionCodec extract({required VideoFile file}) =>
      file.name.contains('mp4')
          ? MPEG4CompressionCodec()
          : OggCompresionCodec();
}

class BitRateReader {
  VideoFile convert({
    required VideoFile file,
    required CompresionCodec originCodec,
    required CompresionCodec destinationCodec,
  }) {
    print('Converting ${file.name}');
    print(
        'Parsing ${originCodec.runtimeType} to ${destinationCodec.runtimeType}');

    final fileName = file.name
        .replaceAll(originCodec is MPEG4CompressionCodec ? 'mp4' : 'ogg', '');

    final newExtension =
        destinationCodec is MPEG4CompressionCodec ? 'mp4' : 'ogg';

    return VideoFile(name: '$fileName$newExtension');
  }
}

/// End of complex Classes for a mock video framework

/// This is the facade class where we work with the
/// complex video class

/// Simple enum for formats
enum VideoFormat { mpge4, ogg }

/// Facade class to handle a better workflow
class VideoConverter {
  /// Single method convert where we use the framework
  String convert({required String fileName, required VideoFormat format}) {
    final file = VideoFile(name: fileName);
    final sourceCodec = CodecFactory().extract(file: file);

    final destinationCodec = switch (format) {
      VideoFormat.mpge4 => MPEG4CompressionCodec(),
      VideoFormat.ogg => OggCompresionCodec(),
    };

    final convertedFile = BitRateReader().convert(
        file: file,
        originCodec: sourceCodec,
        destinationCodec: destinationCodec);

    return convertedFile.name;
  }
}

void main() {
  /// Instead use the original framwork, we use
  /// our facade class
  final convertor = VideoConverter();
  final videoFile = 'My video.mp4';

  print('Origin: $videoFile');

  final fileResult =
      convertor.convert(fileName: videoFile, format: VideoFormat.ogg);

  print('Result: $fileResult');

  /// Here is the result:
  /*
  Origin: My video.mp4
  Converting My video.mp4
  Parsing MPEG4CompressionCodec to OggCompresionCodec
  Result: My video.ogg
  */
}
