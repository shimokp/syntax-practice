import Foundation
import UIKit
import CoreVideo
import Vision
import CoreML

class Processor {
    private func buffer(from image: UIImage) -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return nil
        }

        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

        context?.translateBy(x: 0, y: image.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)

        UIGraphicsPushContext(context!)
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

        return pixelBuffer
    }

    func process(image: UIImage) {
        guard let buffer = buffer(from: image) else {

            return
        }
        // CoreMLのモデルクラスの初期化
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {
            assertionFailure("Error: CoreMLモデルの初期化に失敗しました")
            return
        }

        // 画像認識リクエストを作成（引数はモデルとハンドラ）
        let request = VNCoreMLRequest(model: model) { [weak self] (request: VNRequest, error: Error?) in
            guard let results = request.results as? [VNClassificationObservation] else { return }

            // 判別結果とその確信度を上位3件まで表示
            // identifierは類義語がカンマ区切りで複数書かれていることがあるので、最初の単語のみ取得する
            let displayText = results.prefix(3).compactMap { "\(Int($0.confidence * 100))% \($0.identifier.components(separatedBy: ", ")[0])" }.joined(separator: "\n")

            DispatchQueue.main.async {
                print(displayText)
            }
        }

        // CVPixelBufferに対し、画像認識リクエストを実行
        try? VNImageRequestHandler(cvPixelBuffer: buffer, options: [:]).perform([request])
    }

    func list() {
        guard let classes = try? VNClassifyImageRequest.knownClassifications(forRevision: VNClassifyImageRequestRevision1) else {
            return
        }

        classes.forEach {
            print($0.identifier)
        }

    }
}
