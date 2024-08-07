//
//  ApiManager.swift
//  swift-networkcalls
//
//  Created by Ashfak Ahamed Alauddeen on 06/08/24.
//

import Foundation

class ApiManager{
 
    public func getGitHubUser(_ userName: String, completion: @escaping (Result<GetGHUserResponseModel, Error>) -> Void){

        var urlString = "https://api.github.com/users/\(userName)"
        
        guard let url = URL(string: urlString) else{
            let urlError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(urlError))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            if let data = data{
                do{
                    let user = try JSONDecoder().decode(GetGHUserResponseModel.self, from: data)
                    completion(.success(user))
                }catch let decodingError{
                    completion(.failure(decodingError))
                }
            }
        }
        task.resume()
    }
}
