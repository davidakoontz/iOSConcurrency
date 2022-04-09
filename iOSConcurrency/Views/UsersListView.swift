//
//  UsersListView.swift
//  iOSConcurrency
//
//  Created by David on 4/9/22.
//  From Coding with  Chris -  Swift Concurrency
//  Lesson 1- 6 Creating Models and an APIService
//  by Stweart  Lench
//  6 part series:
//      JSON Decoding
//      APIService creation & improvements
//      Network calls
//      Error Handling
//      more... so much  more.



import SwiftUI

struct UsersListView: View {
    @StateObject var vm = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.users) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.title)
                        Text(user.email)
                            
                    }
                }
            }
            .navigationTitle("Users")
            .listStyle(.plain)
            .onAppear{
                vm.fetchUsers()
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
