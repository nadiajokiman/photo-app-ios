//
//  ViewController.swift
//  photoApp
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePickerController: UIImagePickerController!

    @IBOutlet weak var mainImage: UIImageView!
    
    func saveImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let image = mainImage.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func takePhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        saveImage(imageName: "test.png")

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        mainImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
}
