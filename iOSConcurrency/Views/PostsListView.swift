//
//  PostsListView.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//

import SwiftUI

struct PostsListView: View {
#warning("remove the forPreview argument or set to false before shipping to AppStore")
    @StateObject var vm = PostsListViewModel(forPreview: true)
    var userId:  Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .onAppear{
                vm.userId = userId
                vm.fetchPosts()
            }
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {    // for Preview
            PostsListView( userId: 1)
        }
    }
}
