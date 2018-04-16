import Alamofire
import Foundation

private enum StateFetch: String {
    case ready, executing, finished, failed, stopped
}

class WeatherFetch {

    static let sharedInstance = WeatherFetch()

    private let key: String = "81e4d56dd2e7920cd8cb625529953169"

    private var state: StateFetch = .ready

    private var dataTask: DataRequest?

    weak var delegate: WeatherViewControllerDelagate?

    public func getWeather(coordinates: (Float, Float)) {
        if state == .executing {
            stopFetching()
        }
        state = .executing

        requestServer(adress: URL(string: "http://api.openweathermap.org/data/2.5/forecast?"),
                      with: ["lat": String(describing: coordinates.0),
                             "lon": String(describing: coordinates.1),
                             "units": "metric"]) { result, error in
                            guard let result0 = result,
                            let list = result0["list"] as? [Any],
                            let data = list.first as? [String: Any],
                            let weather = data["weather"] as? [Any],
                            let wind = data["wind"] as? [String: Any],
                            let windspeed = wind["speed"] as? Double,
                            let weather0 = weather.first as? [String: Any],
                            let description = weather0["description"] as? String,
                            let main = data["main"] as? [String: Any],
                            let pressure = main["pressure"] as? Double,
                            let temp = main["temp"] as? Double,
                            let imageDescription = weather0["icon"] as? String,
                            let time = data["dt_txt"] as? String,
                            let mintemp = main["temp_min"] as? Double,
                            let maxtemp = main["temp_max"] as? Double else {
                                self.state = .failed
                                self.delegate?.showError(message: error)
                                return
                        }
                            let weatherObject = Weather(minTemp: mintemp,
                                                        maxTemp: maxtemp,
                                                        temp: temp,
                                                        pressure: pressure,
                                                        wind: windspeed,
                                                        describe: description,
                                                        time: time,
                                                        imageCode: imageDescription)
                            self.delegate?.showWeather(weather: weatherObject)
                            self.state = .finished
        }
    }
    private func requestServer(adress: URL?,
                               with parameters: [String: String],
                               completion: @escaping(([String: Any]?, String?) -> Void)) {
        guard let url = adress else {
            self.state = .failed
            completion(nil, "Error_url_encode" )
            return
        }
        var params = parameters
        params["APPID"] = key
        dataTask = Alamofire.request(url, method: .get, parameters: params).responseJSON { response -> Void in
                if response.error != nil {
                    completion(nil, response.error?.localizedDescription)
                }
                guard response.result.isSuccess,
                let value = response.result.value as? [String: Any] else {
                    self.state = .failed
                    completion(nil, "Error_response_encode")
                    return
            }
            completion(value, nil)
        }
    }
    public func stopFetching() {
        if state == .executing {
            guard let dataTask = dataTask else {
                return
            }
            dataTask.cancel()
        }
    }

    private init() {}
}
