import UIKit

class Weather {
    let maxTemperature: Double
    let minTemperature: Double
    let temperature: Double
    let pressure: Double
    let wind: Double
    let describe: String
    let time: String
    let image: UIImage?

    init(minTemp: Double,
         maxTemp: Double,
         temp: Double,
         pressure: Double,
         wind: Double,
         describe: String,
         time: String,
         imageCode: String) {
        self.maxTemperature = maxTemp
        self.minTemperature = minTemp
        self.temperature = temp
        self.pressure = pressure
        self.wind = wind
        self.describe = describe
        self.time = time
        self.image = {
                if let url = URL(string: "http://openweathermap.org/img/w/\(imageCode).png"),
                let data1 = try? Data(contentsOf: url) {
                let image = UIImage(data: data1)
                    return image
                } else {
                    return nil
                }
            }()
        }
    }
