//
//  NetworkService.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import Foundation
import CryptoKit


protocol NetworkService: AnyObject {
    func retrieveCharacters(completion: @escaping ([[String:Any]]?) -> Void)
}

class NetworkServiceImplementation: NetworkService {
        
    func retrieveCharacters(completion: @escaping ([[String:Any]]?) -> Void) {
        
        let timestamp = String.localizedStringWithFormat("%i", Date().timeIntervalSince1970)
        let hash = md5(string: timestamp + EndPoints.privateKey + EndPoints.publicKey)
        let charactersEndpoint = "/characters?limit=100&offset=\(1)&ts=\(timestamp)&apikey=\(EndPoints.publicKey)&hash=\(hash)"
        let url = EndPoints.base + charactersEndpoint
        
        guard let serviceUrl = URL(string: url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
        
            if let data = data {
                do {
                    let json: [String:Any] = try (JSONSerialization.jsonObject(with: data, options: []) as? [String : Any])!
                    
                    if let dict = json["data"] as? [String:Any], let result = dict["results"] as? [[String: Any]] {
                        completion(result)
                    }else{
                        print("ERROR PARSING DATA")
                        completion(nil)
                    }
                    
                } catch {
                    print(error)
                    completion(nil)
                }
            }
        }.resume()
                    
    }
    
    
    private func md5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    
}
    
