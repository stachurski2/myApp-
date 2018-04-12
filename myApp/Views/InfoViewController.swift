//
//  InfoViewController.swift
//  myApp
//
//  Created by Stanisaw Sobczyk on 17/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import Foundation
import PureLayout
import UIKit

class InfoViewController: RootViewControler {

    var scrollView: UIScrollView = UIScrollView()
    var contentView: UIView = UIView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.heavy)
        label.textAlignment = NSTextAlignment.center
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("default.description", comment: "")
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        label.textAlignment = NSTextAlignment.justified
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpView()
        setUpContraints()
    }
    func setUpView() {
        setUpBar()
        setUpTitle(with: "InfoView View")
        setUpBackButton()
        setUpScrollView()
        setUpText()
    }

    func setUpContraints() {
        setUpBarConstraints()
        setUpTitleContraints()
        setUpBackButtonConstraints()
        setUpScrollViewCostraints()
        setUpTextConstraints()
    }

    func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }

    func setUpScrollViewCostraints() {
        scrollView.autoPinEdge(.leading, to: .leading, of: view)
        scrollView.autoPinEdge(.bottom, to: .bottom, of: view)
        scrollView.autoPinEdge(.trailing, to: .trailing, of: view)
        scrollView.autoPinEdge(.top, to: .bottom, of: viewBar)
        contentView.autoPinEdgesToSuperviewEdges()
    }

    func setUpText() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }

    func setUpTextConstraints() {
            titleLabel.autoPinEdge(.top, to: .top, of: contentView, withOffset: 20)
            titleLabel.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
            titleLabel.autoSetDimension(.width, toSize: view.frame.width - 40)
            titleLabel.textAlignment = .center
            descriptionLabel.autoPinEdge(.top, to: .top, of: titleLabel, withOffset: 40)
            descriptionLabel.autoSetDimension(.width, toSize: view.frame.width - 40)
            descriptionLabel.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
            descriptionLabel.textAlignment = NSTextAlignment.justified
            descriptionLabel.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
            descriptionLabel.autoPinEdge(.right, to: .right, of: contentView, withOffset: 20)
    }
}
