//
//  UsersListViewModel.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

class UsersListViewModel: ObservableObject {
    @Published var users: [User] =  []
    @Published var isLoading: Bool = false
    
    func fetchUsers() {
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        
        let apiService = APIService(urlString: urlStr)
        
        isLoading.toggle()      // show the progress cursor
        // to test the progress cursor use a delay AND
        // in VM set     @StateObject var vm = UsersListViewModel(forPreview: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            apiService.getJSON{(result: Result<[User], APIError>) in
                defer {
                    DispatchQueue.main.async {
                        self.isLoading.toggle()
                    }
                }
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
}

extension UsersListViewModel  {
    convenience init(forPreview: Bool  = false) {
        self.init()
        if forPreview {
            self.users =  User.mockUsers
        }
    }
}
