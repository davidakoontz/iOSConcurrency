//
//  Posts.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import Foundation

// source   https://jsonplaceholder.typicode.com/posts
//  for just one  https://jsonplaceholder.typicode.com/posts/1

struct Post: Codable, Identifiable  {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}



/*
 [
   {
     "userId": 1,
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
   },
   {
     "userId": 1,
     "id": 2,
 */
