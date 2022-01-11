//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by user210109 on 1/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var artName: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var kaydetButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
    }
    
}
