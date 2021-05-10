//
//  ViewController.swift
//  gallary
//
//  Created by Sebastian Radburn on 7/5/21.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePickerController : UIImagePickerController!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func OnPhotoButton(_ sender: Any) {
        imagePickerController = UIImagePickerController()
           imagePickerController.delegate = self
           imagePickerController.sourceType = .camera
           present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       imagePickerController.dismiss(animated: true, completion: nil)
       ImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
    
    
    func saveImage(imageName: String){
       //create an instance of the FileManager
       let fileManager = FileManager.default
       //get the image path
       let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       //get the image we took with camera
       let image = ImageView.image!
       //get the PNG data for this image
        let data = UIImageJPEGRepresentation(image, 1)
       //store it in the document directory
    fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        print(imagePath)
        
        func rotateImage(image: UIImage) -> UIImage? {
                if (image.imageOrientation == UIImage.Orientation.up ) {
                    return image
                }
                UIGraphicsBeginImageContext(image.size)
                image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
                let copy = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return copy
            }
    }
 

    @IBAction func OnSaveButton(_ sender: Any) {
        
        saveImage(imageName: "test.JPEG")
    }
    
    @IBAction func OnGallaryButton(_ sender: Any) {
        performSegue(withIdentifier: "gallarySegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

