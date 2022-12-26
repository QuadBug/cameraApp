//
//  ViewController.swift
//  cameraApp
//
//  Created by Simon Julyan on 26/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update view controller parameters
        imageView.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBlue
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
    }
    
    // Trigger image picker when button tapped
    @IBAction func didTapButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        picker.showsCameraControls = true
        present(picker, animated: true)
    }

}

// View controller set up for image picker
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // for cancel button
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // for image taken and accepted
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        // update image view and save to photo library
        imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
    }
}
