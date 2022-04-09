//
//  mockData.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

// Preview static data for use....
extension User {
    static var mockUsers: [User]  {
        Bundle.main.decode([User].self, from: "users.json")         //  read from Preview Content data file in Debug App Bundle
    }

    static var mockSingleUser: User {
        Self.mockUsers[0]
    }
   
}

extension Post {
    
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "posts.json")         //  read from Preview Content data file in Debug App Bundle
    }
    
    static var mockSinglePost: Post {
        Self.mockPosts[0]
    }
    
    static var mockSingleUsersPostArray: [Post] {
        Self.mockPosts.filter { $0.userId == 1 }        // only user 1's posts
    }
}
