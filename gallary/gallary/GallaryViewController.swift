//
//  GallaryViewController.swift
//  gallary
//
//  Created by Sebastian Radburn on 7/5/21.
//

import UIKit
    
class GallaryViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
    getImage(imageName: "test.JPEG")
    }
    
    @IBOutlet weak var imageview: UIImageView!
    
    func getImage(imageName: String){
        
       let fileManager = FileManager.default
        
       let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       if fileManager.fileExists(atPath: imagePath){
          imageview.image = UIImage(contentsOfFile: imagePath)
       }else{
          print("Panic! No Image!")
        
       }
    }
 

       // Do any additional setup after loading the    view.getImage(imageName: "test.png")

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

