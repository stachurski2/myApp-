import UIKit

class WeatherViewController: UIViewController {

    var completionCoordinates: (() -> (Float, Float)?)?
    var completionCityName: (() -> String?)?

    var weatherView: WeatherView {
        guard let weatherview = view as? WeatherView else {
            return WeatherView()
        }
        return weatherview
    }

    override func loadView() {
        let contentView = WeatherView(navItems: [navigationItem])
        view = contentView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        weatherView.changeIndicatorAnimate(true)
        defineTargets()
        title = completionCityName?()

        guard let coordinates = completionCoordinates?() else {
            weatherView.changeIndicatorAnimate()
            showError(message: "")
            return
        }
        WeatherFetch.sharedInstance.delegate = self
        WeatherFetch.sharedInstance.getWeather(coordinates: coordinates)
    }

    func defineTargets() {
        weatherView.defineTextFieldFunctionTarget(target: self,
                                                  action: #selector(WeatherViewController.back),
                                                  event: .touchUpInside)
    }

    @objc
    func back() {
        dismiss(animated: true, completion: nil)
    }
}

extension WeatherViewController: WeatherViewControllerDelagate {
    func showError(message: String?) {
        let alert = UIAlertController(title: "Alert", message: String(withlocalized: "error_comunicate"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { _ in
            self.back()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func showWeather(weather: Weather) {
        weatherView.showWeather(weather: weather)
    }
}
