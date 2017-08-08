//
//  CircleImage.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/7/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    
    override func awakeFromNib() {
        setUpView()
        
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }

   

}
