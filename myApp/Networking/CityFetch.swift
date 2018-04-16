import Alamofire
import Foundation

private enum StateFetch: String {
    case ready, executing, finished, failed
}

class CityFetch {

    static let sharedInstance = CityFetch()

    private let googleKey: String = "AIzaSyCg1qFJKeKqKu3M2giC1rf0CCaoZrKB_qM"

    private var state: StateFetch = .ready

    private var dataTask: DataRequest?

    public weak var delegate: SearchViewControllerDelegate?

    public func getList(name: String) {
        if state == .executing {
           stopFetching()
        }
        state = .executing
        var cities = [City]()
        requestServer(adress: URL(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json"),
                      with: ["types": "(cities)", "input": name]) { result, error in
                                guard let res = result,
                                    let predictions = res["predictions"] as? [[String: Any]] else {
                                            self.state = .failed
                                             if error != "cancelled" {
                                                self.delegate?.showErrorMessage(message: error)
                                            }
                                    return
                                }
                                for prediction in predictions {
                                    guard let name = prediction["description"] as? String,
                                        let googleid = prediction["place_id"] as? String else {
                                            continue
                                    }
                                    cities.append(City(name: name, googleid: googleid))
                                }
                                self.state = .finished
                                self.delegate?.updateData(cities: cities)
        }
    }

    public func getCoordinates(city: City) {
        if state == .executing {
            stopFetching()
        }
        state = .executing
        var coordinates: (Float, Float) = (0, 0)
        requestServer(adress: URL(string: "https://maps.googleapis.com/maps/api/geocode/json?"),
                      with: ["place_id": city.googleid]) { result, _ in
                        guard let res = result,
                              let results = res["results"] as? [Any],
                              let data = results.first as? [String: Any],
                              let geometry = data["geometry"] as? [String: Any],
                              let location = geometry["location"] as? [String: Any],
                              let lat = location["lat"] as? Double,
                              let lon = location["lng"] as? Double else {
                                self.state = .failed
                                self.delegate?.showErrorMessage(message: "Error_response_encode")
                                return
                            }
                            coordinates = (Float(lat), Float(lon))
                            self.state = .finished
                            self.delegate?.goToWeatherview(with: coordinates)
        }
    }

    public func stopFetching() {
            guard let dataTask = dataTask else {
                return
            }
            dataTask.cancel()
    }

    private func requestServer(adress: URL?,
                               with parameters: [String: String],
                               completion: @escaping(([String: Any]?, String?) -> Void)) {
        guard let url = adress else {
            completion(nil, "Error_url_encode")
            self.state = .failed
            return
        }
        var params = parameters
        params["key"] = googleKey
        dataTask = Alamofire.request(url, method: .get, parameters: params).responseJSON { response -> Void in
            if response.error != nil {
                completion(nil, response.error?.localizedDescription)
                return
            }
            guard response.result.isSuccess,
                let value = response.result.value as? [String: Any] else {
                    completion(nil, "Error_response_encode")
                    return
            }
            completion(value, nil)
        }

    }
    internal init() {}

}
