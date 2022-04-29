//
//  NetworkConnection.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation
import Alamofire

class NetworkConnection {
    func get7TimerData(completion: @escaping (TimerDataResult) -> Void){
        
        let params: Parameters = [
            "lon": "113.2",
            "lat": "23.1",
            "ac": "0",
            "unit": "metric",
            "output": "json",
            "tzshift": "0"
        ]
        
        let baseURL: String = "https://www.7timer.info/bin/astro.php"
        
        AF.request(baseURL, method: .get, parameters: params).responseDecodable(of: Timer.self){
            (response) in
            if let result = response.value?.product{
                completion(.success(response.value!))
                print(response.value!)
            } else {
                completion(.failure("Error"))
            }
        }
    }
    
    enum TimerDataResult {
        case success(Timer)
        case failure(String)
    }
}
