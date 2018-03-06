//
//  InfoViewController.swift
//  myApp
//
//  Created by Stanisaw Sobczyk on 17/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
     let label3 = UILabel(frame: CGRect(x:150, y:50, width:100, height:50))
    let button3 = UIButton(type: .custom)
    var control:Bool = false
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.green
        addButton()
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(back))

        HelloWorld()
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @objc func HelloWorld(){
            label3.text = "Hello World!"
            button3.setTitle("< back", for: .normal)
            self.view.addSubview(label3)
            label3.translatesAutoresizingMaskIntoConstraints = false

        
            self.view.addConstraint(NSLayoutConstraint(item: label3, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: label3, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute:  .centerY, multiplier: 1, constant: 0))

            
            if control == true {control = false
                
            } else {
                control = true
                
                
                
            }
            
        }
        
    func addButton(){
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(nil, action: #selector(InfoViewController.back), for: .touchUpInside)
        self.view.addSubview(button3)
        self.view.addConstraint(NSLayoutConstraint(item: button3, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20))
        self.view.addConstraint(NSLayoutConstraint(item: button3, attribute: .top, relatedBy: .equal, toItem: self.view, attribute:  .top, multiplier: 1, constant: 20))
        
        
        
        
    }
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


