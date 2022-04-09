//
//  APIService.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

struct APIService {
    let urlString: String
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        // old  method of dealing with concurrency -   compkletion handler
        // @esccaping  because the completion function will escape the timeframe/scope of the calling code
        guard
            let url  =  URL(string: urlString)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) {  data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode ==  200
            else {
                return
            }
            guard
                error ==  nil
            else  {
                return
            }
            guard
                let data = data
            else {
                return
            }
            
            let decoder  = JSONDecoder()
            do {
                let decodedData = try decoder.decode([User].self, from: data)
                completion(decodedData)
            } catch {
                print("Error")
            }
        }.resume()
    }
}
