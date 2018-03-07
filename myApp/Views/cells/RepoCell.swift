//
//  cellrepo.swift
//  myApp
//
//  Created by Stanisaw Sobczyk on 17/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import UIKit


class RepoCell:UITableViewCell {
    var name:UILabel?
    var desc:UILabel?

    func configureCell(name: String, description: String){
        
        self.name = UILabel()
        self.desc = UILabel()
        let marginGuide = contentView.layoutMarginsGuide

        guard let nam = self.name, let desc = self.desc else {return}
        nam.font.withSize(12)
        desc.font.withSize(6)
        nam.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false

        self.name?.text = name
        self.desc?.text = description
    
        self.contentView.addSubview(nam)
        self.contentView.addSubview(desc)
        
        nam.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nam.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nam.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nam.numberOfLines = 0
    
        desc.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        desc.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        desc.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        desc.topAnchor.constraint(equalTo: nam.bottomAnchor).isActive = true
        desc.numberOfLines = 0
        desc.font = UIFont(name: "Avenir-Book", size: 12)
        desc.textColor = UIColor.lightGray
        
    }
}
