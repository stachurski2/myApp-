//
//  SearchViewControllerDelegate.swift
//  Airnauts_sandbox
//
//  Created by Stanisaw Sobczyk on 25/03/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import Foundation

protocol SearchViewControllerDelegate: class {
    func updateData(cities: [City])
    func showErrorMessage(message: String?)
    func goToWeatherview(with coordiantes: (Float, Float))
}
