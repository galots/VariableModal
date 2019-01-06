//
//  ModalController.swift
//  VariableModal
//
//  Created by Galo Torres Sevilla on 1/5/19.
//  Copyright © 2019 Galo Torres Sevilla. All rights reserved.
//

import Foundation
import UIKit


final class ModalController : UIViewController {
    
    let modalViewDataSource : [CGFloat] = [4, 5, 10, 5, 1, 15]
    
    lazy var modalView : ModalView = {
        let view = ModalView(frame: .zero)
        view.dataSource = self.modalViewDataSource
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        self.view.addSubview(modalView)
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        modalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        modalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        modalView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func updateConstraint(attribute: NSLayoutConstraint.Attribute, constant: CGFloat) -> Void {
        if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
            constraint.constant = constant
            self.layoutIfNeeded()
        }
    }
}
