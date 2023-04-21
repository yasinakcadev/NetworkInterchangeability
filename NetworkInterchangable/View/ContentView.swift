//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by YASIN on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var userListViewModel = UserListViewModel()
    
    init() {
        self.userListViewModel = UserListViewModel()
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) {user in
            VStack {
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .font(.title2)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .font(.title2)
                    .foregroundColor(.brown)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
