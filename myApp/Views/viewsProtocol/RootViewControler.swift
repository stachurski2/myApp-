//
//  MenuProtocol.swift
//  myApp
//
//  Created by Stanisaw Sobczyk on 17/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class RootViewControler:UIViewController {
    
    lazy var kBarTopMargin: CGFloat = view.frame.height*0.04
    
    let kBarHeight: CGFloat = 50.0
    
    lazy var viewBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var titleOfBar: UILabel = {
        let label = UILabel()
        label.text = "Example Title"
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        label.textAlignment = NSTextAlignment.center
        label.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func setUpBar(){
         view.addSubview(viewBar)
    }
    
    func setUpBarCoinstrants(){
        viewBar.autoPinEdge(.top, to: .top, of: view, withOffset: kBarTopMargin)
        viewBar.autoPinEdge(.leading, to: .leading, of: view)
        viewBar.autoSetDimension(.width, toSize: view.frame.width)
        viewBar.autoSetDimension(.height, toSize: kBarHeight)
    }
    
    func setUpTitle(with text:String){
        titleOfBar.text = text
        viewBar.addSubview(titleOfBar)
    }
    
    func setUpTitleContraints(){
        titleOfBar.autoPinEdgesToSuperviewEdges()
        
    }
    
    
    
    
}
