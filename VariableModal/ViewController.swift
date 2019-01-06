//
//  ViewController.swift
//  VariableModal
//
//  Created by Galo Torres Sevilla on 1/5/19.
//  Copyright © 2019 Galo Torres Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let presentButton : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Present", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(presentButton)
        presentButton.backgroundColor = .red
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        presentButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        presentButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        presentButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        presentButton.addTarget(self, action: #selector(self.presentModal), for: .touchUpInside)
    }

    @objc func presentModal (sender: UIButton) {
        print("Pressent")
        let modalController = ModalController()
        modalController.modalPresentationStyle = .overCurrentContext
        self.present(modalController, animated: true, completion: nil)
    }

}

