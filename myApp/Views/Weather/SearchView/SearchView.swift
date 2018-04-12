import SnapKit
import UIKit

class SearchView: UIView, UITextFieldDelegate {

    private let ktopNavigationBar: Int = 20

    private let kSearchBarInsideMargin: Int = 15

    private let kTextFieldHeight: CGFloat = 50

    private let kIndicatorSize: CGFloat = 50

    private let navigationBar = UINavigationBar()

    private let searchBar: UIView = UIView()

    private lazy var textField: UITextField = {
        let myTextField = UITextField(frame: .zero)
        myTextField.placeholder = String(withlocalized: "enter_city")
        myTextField.font = .systemFont(ofSize: 15)
        myTextField.borderStyle = .roundedRect
        myTextField.autocorrectionType = .no
        myTextField.keyboardType = .default
        myTextField.returnKeyType = .done
        myTextField.clearButtonMode = .whileEditing
        myTextField.contentVerticalAlignment = .center
        myTextField.delegate = self
        return myTextField
    }()

    private lazy var tableView: UITableView = {
      let tableview = UITableView(frame: .zero)
          tableview.register(CellCity.self, forCellReuseIdentifier: "cellCity")
          tableview.register(CellNoResult.self, forCellReuseIdentifier: "cellNoResult")
          tableview.register(CellError.self, forCellReuseIdentifier: "cellError")

          tableview.separatorStyle = .none
          return tableview
    }()

    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.isHidden = true
        indicator.activityIndicatorViewStyle = .gray
        return indicator
        }()

    public var getTextfieldText: String {
        do {
            guard let text = textField.text else {
                return ""
            }
            return text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(navItems: [UINavigationItem]) {
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
        navigationBar.setItems(navItems, animated: false)
    }

    private func setUpView() {
        addSubview(navigationBar)
        addSubview(searchBar)
        searchBar.addSubview(textField)
        addSubview(tableView)
        addSubview(indicator)
    }

    private func setUpConstraints() {
        navigationBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(ktopNavigationBar)
        }
        searchBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(navigationBar.snp.bottom)
        }
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(kSearchBarInsideMargin)
            make.right.equalToSuperview().offset(-kSearchBarInsideMargin)
            make.top.equalToSuperview().offset(kSearchBarInsideMargin)
            make.bottom.equalToSuperview().offset(-kSearchBarInsideMargin)
            make.height.equalTo(kTextFieldHeight)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.right.left.equalToSuperview()
        }
        indicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(kIndicatorSize)
        }
    }

    public func defineTextFieldFunctionTarget(target: Any, action: Selector, event: UIControlEvents) {
        textField.addTarget(target, action: action, for: event)
    }

    public func setTableViewDataSource(_ datasource: UITableViewDataSource) {
        tableView.dataSource = datasource
    }

    public func setTableViewDelegate(_ delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }

    public func tableViewReloadData() {
        tableView.reloadData()
    }

    public func changeIndicatorAnimate(_ visibilty: Bool = false) {
        if visibilty {
            indicator.isHidden = false
            indicator.startAnimating()
        } else {
            indicator.isHidden = true
            indicator.stopAnimating()
        }
    }

}
