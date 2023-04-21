//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by YASIN on 21.04.2023.
//

import Foundation

class UserListViewModel:ObservableObject {
    @Published var userList = [UserViewModel]()
    
    let webservice = Webservice()
    
    func downloadUsers() async{
        do {
            let users = try await webservice.downloadUsers(Constants.Urls.usersExtension)
            
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch {
            print(error)
        }
    }
    
}

struct UserViewModel {
    let user: User
    
    var id: Int {
        self.user.id
    }
    
    var name: String {
        self.user.name
    }
    
    var username: String {
        self.user.username
    }
    
    var email: String {
        self.user.email
    }
}
