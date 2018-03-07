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
    
    let barColor: UIColor = .red
    
    lazy var viewBar: UIView = {
        let view = UIView()
        view.backgroundColor = barColor
        return view
    }()
    
    lazy var titleOfBar: UILabel = {
        let label = UILabel()
        label.text = "Example Title"
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        label.textAlignment = NSTextAlignment.center
        label.textColor = .white
        return label
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton(type: .infoLight)
        return button
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("<", for: UIControlState.normal)
        button.setTitleColor(.white, for:  UIControlState.normal)
        return button
    }()
    
    func setUpBar(){
         view.addSubview(viewBar)
    }
    
    func setUpBarConstraints(){
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
    
    func setUpRightButton(button:UIButton? = nil, action:Selector? = nil){
        guard let button = button,
            let action = action else { viewBar.addSubview(rightButton) ; return}
        button.addTarget(nil, action: action, for: .allTouchEvents)
        rightButton = button
        viewBar.addSubview(rightButton)
    }
    
    func setUpLeftButton(button:UIButton? = nil, action:Selector? = nil){
         guard let button = button,
            let action = action else { viewBar.addSubview(leftButton) ; return}
         button.addTarget(nil, action: action, for: .allTouchEvents)
         leftButton = button
         viewBar.addSubview(leftButton)
    }
    
    func setUpRightButtonConstraints(){
        rightButton.autoPinEdge(.top, to: .top, of: viewBar, withOffset: 15)
        rightButton.autoPinEdge(.trailing, to: .trailing, of: viewBar, withOffset: -10)
    }
    
    func setUpLeftButtonConstraint(){
        leftButton.autoPinEdge(.top, to: .top, of: viewBar, withOffset: 15)
        leftButton.autoPinEdge(.leading, to: .leading, of: viewBar, withOffset: 10)
    }
    
    func setUpBackButton(){
        viewBar.addSubview(backButton)
        backButton.addTarget(nil, action: #selector(back), for: .touchUpInside)
    }
    
    func setUpBackButtonConstraints(){
        backButton.autoPinEdge(.top, to: .top, of: viewBar, withOffset: 8)
        backButton.autoPinEdge(.leading, to: .leading, of: viewBar, withOffset: 10)
    }
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
