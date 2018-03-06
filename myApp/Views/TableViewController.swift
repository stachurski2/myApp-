//
//  ViewController.swift
//  myApp
//
//  Created by Stanisaw Sobczyk on 15/02/2018.
//  Copyright © 2018 Stanisaw Sobczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MenuProtocol, TableViewProtocol { 
  
    
    var button:UIButton = UIButton(type: .infoLight)
    var tableview:UITableView? = nil
   
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        super.viewDidLoad()
        addMenu(view: view )
        button = setInfoButton(view: view)
        button.addTarget(nil, action: #selector(ViewController.changeView), for: .touchUpInside)
        tableview = addTableView(view)
        _ = setTitle(view: view, title: "MainView")
    }
    
    @objc func changeView(){
          let vc = InfoViewController()
          self.present(vc, animated: true, completion: nil)
    }
}


extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepoCell(style: .default, reuseIdentifier: "repo")
        cell.configureCell(name: "cellTitle \(indexPath.row)", description: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?")
        return cell as UITableViewCell
    }
    
    
}








