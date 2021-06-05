//
//  ViewController.swift
//  ToJpgOrPng
//
//  Created by Tsai I Lun on 2021/6/5.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    let fileOP = FileOperation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fileOP.save(fileName: "123", bytes: Data())
    }
    
    @IBAction func showCamera(_ sender: Any) {
        let imageViewController = UIImagePickerController()
        imageViewController.sourceType = .camera
        imageViewController.delegate = self
        self.present(imageViewController, animated: true) {
            print(#line)
        }
    }
    
    @IBAction func showAlbum(_ sender: Any) {
        let phpViewController = PHPickerViewController(configuration: PHPickerConfiguration())
        phpViewController.delegate = self
        self.present(phpViewController, animated: true) {
            print(#line)
        }
        
        
    }
    
    @IBAction func showInOldWay(_ sender: Any) {
        let imageViewController = UIImagePickerController()
        imageViewController.delegate = self
        self.present(imageViewController, animated: true) {
            print(#line)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        defer{
            picker.dismiss(animated: true) {
                print(#line)
            }
        }
        print(#line)
        guard let img = info[.originalImage] as? UIImage else {
            return
        }
        print(img)
        print(img.jpegData(compressionQuality: 0.5))
        fileOP.save(fileName: NSDate().description, bytes: img.jpegData(compressionQuality: 0.5)!)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print(#line)
        picker.dismiss(animated: true) {
            print(#line)
        }
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        print(#line, results)
        
        defer{
            picker.dismiss(animated: true) {
                print(#line)
            }
        }
        
        guard results.count > 0 else {
            return
        }
        
        let provider = results[0].itemProvider
        
        provider.loadObject(ofClass: UIImage.self) { reading, error in
            print(#line, reading, error)
            
            self.fileOP.save(fileName: NSDate().description, bytes: (reading as! UIImage).jpegData(compressionQuality: 0.5)!)
        }
    }
}




