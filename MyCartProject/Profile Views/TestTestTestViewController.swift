//
//  TestTestTestViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 17/07/25.
//

import UIKit
import Combine



class TestTestTestViewController: UIViewController {


    
    @IBOutlet weak var userSearchTxtField: UITextField!
    
    
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        observeTextChanges()
    }


    
    private func observeTextChanges() {
           NotificationCenter.default
               .publisher(for: UITextField.textDidChangeNotification, object: userSearchTxtField)
               .compactMap { ($0.object as? UITextField)?.text }
               .sink { text in
                   print("User typed: \(text)")
               }
               .store(in: &cancellables)
       }
   
}





