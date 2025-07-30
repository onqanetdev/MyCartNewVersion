//
//  ForgetPasswordViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 28/07/25.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    
    
    @IBOutlet weak var forgetView: UIView!{
        didSet {
            forgetView.layer.cornerRadius = 25
            forgetView.clipsToBounds = true
            
            // Add dark shadow
            forgetView.layer.shadowColor = UIColor.black.cgColor
            forgetView.layer.shadowOpacity = 0.8
            forgetView.layer.shadowOffset = CGSize(width: 0, height: 4)
            forgetView.layer.shadowRadius = 8
            forgetView.layer.masksToBounds = false
        }
    }
    

    
    
    @IBOutlet weak var emailIdTxtFld: UITextField!{
        didSet{
            emailIdTxtFld.layer.borderColor = UIColor.black.cgColor
            emailIdTxtFld.layer.borderWidth = 1.0
            emailIdTxtFld.layer.cornerRadius = 10.0
            emailIdTxtFld.clipsToBounds = true
        }
    }
    
    
    
    @IBOutlet weak var submitBtn: UIButton!{
        didSet{
            submitBtn.layer.cornerRadius = 10
            submitBtn.clipsToBounds = true
        }
    }
    
    
    @Published var isSubmitted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    

}
