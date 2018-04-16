import UIKit

enum DataStatus: Int {
    case noresults, error, good, empty
}

class SearchViewController: UIViewController {

    var searchView: SearchView {
        guard let searchView = view as? SearchView else {
            return SearchView()
        }
        return searchView
    }

    var cities = [City]()

    var citiesStatus: DataStatus = .empty {
        didSet {
            searchView.changeIndicatorAnimate()
            searchView.tableViewReloadData()
        }
    }
    var cityName: String?

    var coordinates: (Float, Float)?

    var errorMessage: String?

    let queue = DispatchQueue(label: "City")

    override func loadView() {
        let contentView = SearchView(navItems: [navigationItem])
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        defineTargets()
        searchView.setTableViewDataSource(self)
        searchView.setTableViewDelegate(self)
        title = String(withlocalized: "select_city")
        CityFetch.sharedInstance.delegate = self
    }

    func defineTargets() {
        searchView.defineTextFieldFunctionTarget(target: self,
                                                 action: #selector(SearchViewController.fetchPlaces),
                                                 event: .allEditingEvents)
    }

    @objc
    func fetchPlaces() {
        citiesStatus = .empty
        let name = searchView.getTextfieldText
        if !name.isEmpty {
            CityFetch.sharedInstance.getList(name: name)
            searchView.changeIndicatorAnimate(true)
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch citiesStatus {
        case .good:
            return cities.count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch citiesStatus {
        case .good:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCity", for: indexPath)
            if indexPath.row < cities.count {
                (cell as? CellCity)?.label.text = cities[indexPath.row].name
            }
            return cell
        case .noresults:
            return tableView.dequeueReusableCell(withIdentifier: "cellNoResult", for: indexPath)
        case .error:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellError", for: indexPath)
            guard let mes = errorMessage else {
                return cell
            }
            (cell as? CellError)?.label.text = mes
            return cell
        case .empty:
            return UITableViewCell()
        }
    }

}

extension SearchViewController: SearchViewControllerDelegate {

    func goToWeatherview(with coordiantes: (Float, Float)) {
        coordinates = coordiantes
        let viewController = WeatherViewController()
        viewController.completionCoordinates = {
            return self.coordinates
        }
        viewController.completionCityName = {
            return self.cityName
        }
        self.present(viewController, animated: true)
    }

    func updateData(cities: [City]) {
        self.cities = cities
        citiesStatus = cities.isEmpty ? .noresults : .good
    }

    func showErrorMessage(message: String?) {
        citiesStatus = .error
        guard let mess = message else {
            return
        }
        errorMessage = String(withlocalized: mess)
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if citiesStatus == .good {
            coordinates = nil
            cityName = cities[indexPath.row].name
            CityFetch.sharedInstance.getCoordinates(city: cities[indexPath.row])
            }
        }
    }
