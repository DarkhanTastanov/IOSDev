import Foundation
import Alamofire

protocol AirlineManagerDelegate {
    func onHeroDidFetch(_ heroes: [Airline])
}

struct AirlineManager {
    private let api = "https://api.api-ninjas.com/v1/airlines"
    var delegate: AirlineManagerDelegate?

    func fetchAirlines(completion: @escaping ([Airline]?) -> Void) {
        let headers: HTTPHeaders = [
            "X-Api-Key": "aXcZkvukWtYZroAcNIgkkQ==3RV9LYlhN4TAjLAo"
        ]

        AF.request(api, headers: headers).responseDecodable(of: [Airline].self) { response in
            switch response.result {
            case .success(let airlines):
                completion(airlines)
            case .failure(let error):
                print("Error fetching airlines: \(error)")
                completion(nil)
            }
        }
    }
}