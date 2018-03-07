//
//  InfoViewController.swift
//  myApp
//
//  Created by Stanisaw Sobczyk on 17/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class InfoViewController: RootViewControler  {
   
    
 
    var scrollView:UIScrollView = UIScrollView()
    var contentView:UIView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.heavy)
        label.textAlignment = NSTextAlignment.center
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim eu turpis egestas pretium aenean pharetra magna. Ipsum a arcu cursus vitae congue mauris rhoncus. Tortor consequat id porta nibh venenatis. Feugiat vivamus at augue eget arcu dictum. Nec sagittis aliquam malesuada bibendum. Viverra nam libero justo laoreet sit amet cursus. Nisl purus in mollis nunc sed id semper risus. Vitae purus faucibus ornare suspendisse sed nisi lacus sed viverra. Metus aliquam eleifend mi in nulla posuere sollicitudin. Id venenatis a condimentum vitae sapien pellentesque. Phasellus faucibus scelerisque eleifend donec pretium vulputate. Nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Nec nam aliquam sem et tortor. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Vel elit scelerisque mauris pellentesque pulvinar. Pharetra vel turpis nunc eget lorem dolor sed viverra. Fusce ut placerat orci nulla pellentesque dignissim enim. Tincidunt vitae semper quis lectus nulla at volutpat. Viverra adipiscing at in tellus integer feugiat scelerisque varius. Hac habitasse platea dictumst quisque sagittis purus. Pharetra convallis posuere morbi leo urna molestie at elementum eu. Elementum facilisis leo vel fringilla est ullamcorper eget. Sagittis vitae et leo duis ut diam. Arcu risus quis varius quam quisque id diam vel. Sapien pellentesque habitant morbi tristique senectus. Sagittis orci a scelerisque purus semper eget duis at. Vestibulum morbi blandit cursus risus at. Arcu dictum varius duis at consectetur lorem donec massa. Arcu dui vivamus arcu felis bibendum ut tristique et egestas. Eros donec ac odio tempor. Et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut. Semper risus in hendrerit gravida rutrum quisque non tellus orci. Sapien faucibus et molestie ac feugiat. Dignissim suspendisse in est ante in. Amet mattis vulputate enim nulla aliquet porttitor. Lacus sed viverra tellus in hac habitasse platea. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Sodales ut eu sem integer. Mauris sit amet massa vitae. Facilisi etiam dignissim diam quis. Nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque. Habitant morbi tristique senectus et netus et malesuada. Quam elementum pulvinar etiam non quam lacus suspendisse. Tempus urna et pharetra pharetra massa massa ultricies. In hac habitasse platea dictumst vestibulum rhoncus est. Sit amet commodo nulla facilisi. Sed faucibus turpis in eu mi bibendum neque. Sed viverra ipsum nunc aliquet bibendum. Ut aliquam purus sit amet luctus venenatis."
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        label.textAlignment = NSTextAlignment.justified
        label.numberOfLines = 0
        return label
    }()

    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        setUpView()
        setUpContraints()
    }
    
    func setUpView(){
        setUpBar()
        setUpTitle(with: "InfoView View")
        setUpLeftButton(button: backButton, action: #selector(InfoViewController.back))
        setUpScrollView()
        setUpText()
    }

    func setUpContraints(){
        setUpBarConstraints()
        setUpTitleContraints()
        setUpLeftButtonConstraint()
        setUpScrollViewCostraints()
        setUpTextConstraints()
    }
    
    func setUpScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
  
    func setUpScrollViewCostraints(){
        scrollView.autoPinEdge(.leading, to: .leading, of: view)
        scrollView.autoPinEdge(.bottom, to: .bottom, of: view)
        scrollView.autoPinEdge(.trailing, to: .trailing, of: view)
        scrollView.autoPinEdge(.top, to: .bottom, of: viewBar)
        contentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setUpText(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    func setUpTextConstraints(){
            titleLabel.autoPinEdge(.top, to: .top, of: contentView, withOffset: 20)
            titleLabel.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
            titleLabel.autoSetDimension(.width, toSize: view.frame.width-40)
            titleLabel.textAlignment = .center
            descriptionLabel.autoPinEdge(.top, to: .top, of: titleLabel, withOffset: 40)
            descriptionLabel.autoSetDimension(.width, toSize: view.frame.width-40)
            descriptionLabel.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
            descriptionLabel.textAlignment = NSTextAlignment.justified
            descriptionLabel.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
            descriptionLabel.autoPinEdge(.right, to: .right, of: contentView, withOffset: 20)
        
    }
        

    
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    

    
    
  
    
    


}





