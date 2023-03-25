//
//  ViewController.swift
//  ImageRecognition
//
//  Created by Chetan Patel on 2023-03-24.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        let imagePath = Bundle.main.path(forResource: "car", ofType: "jpg")
        let imageURL = NSURL.fileURL(withPath: imagePath!)
        
        let modelFile = MobileNetV2()
        let model = try! VNCoreMLModel(for: modelFile.model)
        
        let handler = VNImageRequestHandler(url: imageURL)
        let request = VNCoreMLRequest(model: model, completionHandler: findResults)
        try! handler.perform([request])
        
    }


}

