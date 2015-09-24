//
//  HPXibDesignable.swift
//  Pods
//
//  Created by Huy Pham on 9/24/15.
//
//

import UIKit

@IBDesignable
class HPXibDesignable: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
    
    private func setupNib() {
        let view = self.loadNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(view)
        
        let bindings = ["view": view]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: bindings))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: bindings))
    }
    
    private func loadNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: self.nibName(), bundle: bundle)
        return nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    }
    
    private func nibName() -> String {
        return self.dynamicType.description().componentsSeparatedByString(".").last!
    }
}
