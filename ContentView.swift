import SwiftUI
import Vision
import CoreML

struct ContentView: View {
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    @State private var detectedFood: String = "No image selected"
    
    var body: some View {
        VStack {
            if let image = inputImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                Rectangle()
                    .fill(Color.secondary)
                    .frame(height: 300)
                    .overlay(Text("Tap to select a photo").foregroundColor(.white))
            }

            Text("Detected Food: \(detectedFood)")
                .font(.headline)
                .padding()
            
            Button("Select Photo") {
                showImagePicker = true
            }
            .padding()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage, completionHandler: classifyImage)
        }
    }
    
    func classifyImage() {
        guard let image = inputImage,
              let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
            return
        }
        
        let request = VNCoreMLRequest(model: model) { request, _ in
            if let result = request.results?.first as? VNClassificationObservation {
                DispatchQueue.main.async {
                    detectedFood = result.identifier
                }
            }
        }

        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        try? handler.perform([request])
    }
}
