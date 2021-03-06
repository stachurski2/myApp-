//
//  CellNoResult.swift
//  Airnauts_sandbox
//
//  Created by Stanisaw Sobczyk on 27/03/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import UIKit

class CellNoResult: RootCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label.text = String(withlocalized: "no_results")
        label.textAlignment = .center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
