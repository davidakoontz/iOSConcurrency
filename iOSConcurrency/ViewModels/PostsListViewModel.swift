//
//  PostsListViewModel.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    var userId:  Int?
    
    func fetchPosts() {
        //let urlStr = "https://jsonplaceholder.typicode.com/users/1/posts"
        
        if let userId = userId  {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            apiService.getJSON{(result: Result<[Post], APIError>) in
                switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.posts = posts
                    }
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
}


extension PostsListViewModel  {
    convenience init(forPreview: Bool  = false) {
        self.init()
        if forPreview {
            self.posts =  Post.mockSingleUsersPostArray
        }
    }
}
