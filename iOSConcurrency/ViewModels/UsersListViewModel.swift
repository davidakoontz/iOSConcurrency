//
//  UsersListViewModel.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

class UsersListViewModel: ObservableObject {
    @Published var users: [User] =  []
    
    func fetchUsers() {
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        
        let apiService = APIService(urlString: urlStr)
        apiService.getJSON{(result: Result<[User], APIError>) in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}
