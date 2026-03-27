//
//  facade.swift
//
//
//

import Foundation

// MARK: -  Complex Classes for a mock video framework
struct VideoFile {
    let name: String

    init(name: String) {
        self.name = name
    }
}

protocol CompresionCodec {}

struct OggCompresionCodec: CompresionCodec {}

struct MPEG4CompressionCodec: CompresionCodec {}

struct CodecFactory {
    func extract(file: VideoFile) -> any CompresionCodec {
        file.name.contains("mp4") ? MPEG4CompressionCodec() : OggCompresionCodec()
    }
}

struct BitRateReader {
    func convert(
        file: VideoFile,
        originCodec: any CompresionCodec,
        destinationCodec: any CompresionCodec
    ) -> VideoFile {
        print("Converting \(file.name)")
        print("Parsing \(type(of: originCodec)) to \(type(of: destinationCodec))")

        let fileName = file.name.replacingOccurrences(
            of: originCodec is MPEG4CompressionCodec ? "mp4" : "ogg", with: "")

        let newExtension = destinationCodec is MPEG4CompressionCodec ? "mp4" : "ogg"

        return VideoFile(name: "\(fileName)\(newExtension)")
    }
}


// MARK: - This is the facade class where we work with the complex video class

// Simple enum for formats
enum VideoFormat { case mpeg4, ogg }

// Facade class to handle a better workflow
struct VideoConverter {
    // Single method convert where we use the framework
    func convert(fileName: String, format: VideoFormat) -> String {
        let file = VideoFile(name: fileName)
        let sourceCodec = CodecFactory().extract(file: file)

        let destinationCodec: any CompresionCodec = switch format {
        case .mpeg4: MPEG4CompressionCodec()
        case .ogg: OggCompresionCodec()
        }

        let convertedFile = BitRateReader().convert(
            file: file,
            originCodec: sourceCodec,
            destinationCodec: destinationCodec)

        return convertedFile.name
    }
}

// Demo

// Instead of using the original framework, we use
// our facade class
let convertor = VideoConverter()
let videoFile = "My video.mp4"

print("Origin: \(videoFile)")

let fileResult = convertor.convert(fileName: videoFile, format: .ogg)

print("Result: \(fileResult)")

// Here is the result:

// Origin: My video.mp4
// Converting My video.mp4
// Parsing MPEG4CompressionCodec to OggCompresionCodec
// Result: My video.ogg
