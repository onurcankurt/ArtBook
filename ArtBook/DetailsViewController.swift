//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by user210109 on 1/11/22.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var artName: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var kaydetButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kaydetButton.isEnabled = false

        // Do any additional setup after loading the view.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageRecognizer)
        
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        kaydetButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let yeniResim = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        yeniResim.setValue(artistName.text!, forKey: "artist")
        yeniResim.setValue(artName.text!, forKey: "name")
        
        if let yil = Int(yearText.text!){
            yeniResim.setValue(yil, forKey: "year")
        }
        
        yeniResim.setValue(UUID(), forKey: "id")
        
        //let data = imageView.image!.jpegData(compressionQuality: 0.5)
        if let image = imageView.image{
            let data = image.jpegData(compressionQuality: 0.5)
            yeniResim.setValue(data, forKey: "image")
        }
        
        do{
            try context.save()
            print("başarılı bir şekilde kaydedildi")
        }catch{
            print("hata oldu")
        }
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
}
