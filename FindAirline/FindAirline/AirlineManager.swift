import Foundation
import Alamofire

protocol AirlineManagerDelegate {
    func onHeroDidFetch(_ heroes: [Airline])
}

struct AirlineManager {
    private let api = "https://api.api-ninjas.com/v1/airlines?name="
    private let testApi = "https://api.api-ninjas.com/v1/airlines?name=Lufthansa"
    var delegate: AirlineManagerDelegate?

    func fetchAirlines(searchText: String, completion: @escaping ([Airline]?) -> Void) {
        let headers: HTTPHeaders = [
            "X-Api-Key": "aXcZkvukWtYZroAcNIgkkQ==3RV9LYlhN4TAjLAo"
        ]
        
        let modifiedApi = api + searchText

        AF.request(modifiedApi, headers: headers).responseDecodable(of: [Airline].self) { response in
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
