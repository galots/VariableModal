//
//  ModalView.swift
//  VariableModal
//
//  Created by Galo Torres Sevilla on 1/5/19.
//  Copyright © 2019 Galo Torres Sevilla. All rights reserved.
//

import Foundation
import UIKit

final class ModalView : UIView {
    
    var dataSource : [CGFloat]? = []
    var counter = 0
    
    let nextButton : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupViews()
    }
    
    func setupViews () {
        self.backgroundColor = .red
        self.addSubview(nextButton)
        nextButton.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 50))
        nextButton.addTarget(self, action: #selector(self.changeHeight), for: .touchUpInside)
    }
    
    @objc func changeHeight (sender: UIButton) {
        print("Change")
        guard let dataSource = self.dataSource else {return}
        let height = dataSource[counter] * 50
        self.updateConstraint(attribute: NSLayoutConstraint.Attribute.height, constant: height)
        if self.counter < dataSource.count - 1 {
            self.counter += 1
        }
    }
}
