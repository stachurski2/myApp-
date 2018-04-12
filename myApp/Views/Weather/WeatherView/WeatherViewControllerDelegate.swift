import Foundation

protocol WeatherViewControllerDelagate: class {
    func showWeather(weather: Weather)
    func showError(message: String?)
}
