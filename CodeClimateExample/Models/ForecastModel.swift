import Foundation
import UIKit

// MARK: Struct
struct DailyForecast: Codable {
    let date: String
    let maxTemp: String
    let minTemp: String
    
    enum CodingKeys : String, CodingKey {
        case date
        case maxTemp = "maxtempC"
        case minTemp = "mintempC"
    }
}

struct Location: Codable {
    let name: String
    
    enum CodingKeys : String, CodingKey {
        case name = "query"
    }
}

struct Forecast: Codable {
    let dailyforecasts: [DailyForecast]
    let location: [Location]
    
    enum CodingKeys : String, CodingKey {
        case dailyforecasts = "weather"
        case location = "request"
    }
}

struct ForecastResult: Codable {
    let result: Forecast
    
    enum CodingKeys : String, CodingKey {
        case result = "data"
        
    }
    
    static var API_KEY = "9cc342e3787548f5820111843190102"
    static var basePath = "http://api.worldweatheronline.com/premium/v1/weather.ashx"
    
    static func getForecastResults(query: String, completion: @escaping (ForecastResult?) -> Void) {
        if let url = URL(string: "\(basePath)?q=\(query)&format=json&num_of_days=5&key=\(API_KEY)") {
            print(url)
            let forecastTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                print(data)
                do {
                    let forecastResult = try! JSONDecoder().decode(ForecastResult.self, from: data)
                    completion(forecastResult)
                } catch {
                    print("json error: \(error.localizedDescription)")
                }
            }
            forecastTask.resume()
        }
    }
}
