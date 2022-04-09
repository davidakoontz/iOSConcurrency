//
//  APIService.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

struct APIService {
    let urlString: String
    
    func getUsers(completion: @escaping (Result<[User], APIError>) -> Void) {
        // old  method of dealing with concurrency -   compkletion handler
        // @esccaping  because the completion function will escape the timeframe/scope of the calling code
        guard
            let url  =  URL(string: urlString)
        else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) {  data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode ==  200
            else {
                completion(.failure(.invalidResponseStatus))
                return
            }
            guard
                error ==  nil
            else  {
                completion(.failure(.dataTaskError))
                return
            }
            guard
                let data = data
            else {
                completion(.failure(.corruptData))
                return
            }
            
            let decoder  = JSONDecoder()
            do {
                let decodedData = try decoder.decode([User].self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
                //print("Error")
            }
        }.resume()
    }
}

// our custom thrown error
enum APIError:  Error {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError
    case corruptData
    case decodingError
    
}
