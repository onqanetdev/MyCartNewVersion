//
//  AboutUsViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 29/07/25.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    let aboutUsView = ReUsableSampleView(title: "Terms & Conditions", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempus felis ac odio pharetra, dignissim pharetra mauris pulvinar. Aenean quis turpis tellus. Proin scelerisque neque quis turpis porttitor imperdiet. Sed metus lectus, vulputate nec vestibulum sed, ornare ac urna. Sed justo sapien, fringilla id nisl in, venenatis consectetur orci. Etiam laoreet nunc nulla. Ut ultrices augue eu pellentesque auctor. Sed sit amet felis aliquam, placerat risus id, luctus tellus. Morbi non leo eget eros iaculis pellentesque. Donec feugiat accumsan diam, eget mattis dolor fermentum id. Morbi aliquam tristique luctus. Donec sed cursus eros. Nam viverra dui eget faucibus congue.Sed in ligula feugiat, feugiat enim sed, lobortis libero. Vivamus dignissim nisl a tellus aliquam, quis volutpat risus finibus. Nunc maximus libero et venenatis ullamcorper. Proin id efficitur nisl, eget pellentesque purus. Duis sapien eros, luctus sit amet lorem eu, fringilla accumsan urna. Maecenas eget lectus et urna lobortis dictum. Mauris in leo ut eros ultricies accumsan eget sit amet leo. Aliquam sit amet libero nec tellus luctus laoreet. Pellentesque vitae ligula purus. Ut id dui vel turpis porta mattis. Suspendisse potenti. Nulla at felis in nisl scelerisque dapibus vitae hendrerit elit. Integer tincidunt purus ut purus euismod, id interdum nulla sagittis.Mauris ut suscipit velit, nec congue diam. Nam dictum, est sit amet porttitor lobortis, urna est malesuada purus, ac fringilla erat leo at mauris. Duis nulla tortor, vulputate quis condimentum at, dictum eu metus. Aliquam ut posuere tellus. Aenean eget ligula fermentum, bibendum enim eget, molestie est. Morbi vestibulum vel nibh eu interdum. Nullam ac ipsum neque. Maecenas ultrices velit nec velit dictum condimentum. Proin euismod consequat scelerisque. Etiam at pretium libero. Nunc venenatis sodales nulla. Maecenas condimentum urna a diam pretium, quis mollis libero feugiat. Praesent augue dolor, tristique gravida congue vitae, porttitor non urna. Maecenas bibendum lacus sit amet finibus gravida. Nullam hendrerit massa sapien, id ultrices diam cursus ut.Cras tempor non diam et sollicitudin. Nunc viverra vitae eros eu tempor. Donec convallis faucibus arcu, et lobortis ipsum. Sed eget velit auctor, malesuada elit id, porta justo. Morbi eget sagittis quam. Nam pharetra iaculis vestibulum. Quisque libero erat, aliquam eu auctor ac, sollicitudin et ex. Integer ut augue mauris. In euismod efficitur placerat. Quisque ultrices iaculis ex id faucibus. Aliquam eget magna imperdiet lectus vehicula scelerisque at quis justo. Ut pulvinar nunc id rhoncus ullamcorper. Pellentesque congue consequat elit vel vestibulum. Pellentesque lobortis felis vitae porta egestas.Vivamus sit amet diam eget nunc viverra semper. Aenean porttitor nulla id erat pulvinar posuere. Nulla lorem libero, tristique in efficitur id, sollicitudin nec ligula. Duis a ex tempor, tincidunt tortor vitae, pellentesque libero. Ut libero turpis, malesuada ac neque sed, luctus lacinia tortor. Vivamus maximus diam eget cursus imperdiet. Quisque bibendum neque magna, et ultricies nisl ornare sed. Cras volutpat ullamcorper erat, sit amet sagittis metus bibendum id. Etiam non nibh malesuada, aliquam neque at, tincidunt enim. Nulla sit amet libero vestibulum, aliquam erat non, viverra nunc.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(aboutUsView)
        setUpPrivacyView()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpPrivacyView(){
        aboutUsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutUsView.topAnchor.constraint(equalTo: view.topAnchor),
            aboutUsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutUsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutUsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
