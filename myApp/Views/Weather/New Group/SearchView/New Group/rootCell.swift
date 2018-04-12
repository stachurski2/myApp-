//
//  rootCell.swift
//  Airnauts_sandbox
//
//  Created by Stanisaw Sobczyk on 27/03/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import UIKit

class RootCell: UITableViewCell {
    let kDefaultCellMargin: CGFloat = 20.0

     var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
        setUpCellConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setUpCell() {
        addSubview(label)
        clipsToBounds = true
        setUpCellConstraints()
        self.backgroundColor = .lightGray
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }

    func setUpCellConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(kDefaultCellMargin)
            make.left.equalToSuperview().offset(kDefaultCellMargin)
            make.right.equalToSuperview().offset(-kDefaultCellMargin)
            make.bottom.equalToSuperview().offset(-kDefaultCellMargin)
        }
    }
}
