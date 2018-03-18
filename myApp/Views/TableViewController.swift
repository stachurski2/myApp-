import UIKit

class TableViewController: RootViewControler {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        super.viewDidLoad()
        setUpView()
        setUpContraints()
    }

    func setUpView() {
        setUpBar()
        setUpTitle(with: "TableView View")
        setUpTableView()
        setUpRightButton(button: UIButton(type: .infoDark), action: #selector(TableViewController.goToInfoViewController))
    }

    func setUpContraints() {
        setUpBarConstraints()
        setUpTitleContraints()
        setUpTableViewConstraints()
        setUpRightButtonConstraints()
    }

    func setUpTableView() {
         view.addSubview(tableView)
    }

    func setUpTableViewConstraints() {
         tableView.autoPinEdge(.leading, to: .leading, of: view)
         tableView.autoPinEdge(.bottom, to: .bottom, of: view)
         tableView.autoPinEdge(.trailing, to: .trailing, of: view)
         tableView.autoPinEdge(.top, to: .bottom, of: viewBar)
    }

    @objc
    func goToInfoViewController() {
        present(InfoViewController(), animated: true, completion: nil)
    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepoCell(style: .default, reuseIdentifier: "repo")
        cell.configureCell(name: "cellTitle \(indexPath.row)", description: NSLocalizedString("cell.description", comment: ""))
        return cell as UITableViewCell
    }
}
