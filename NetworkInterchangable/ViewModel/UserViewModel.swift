//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by YASIN on 21.04.2023.
//

import Foundation

class UserListViewModel:ObservableObject {
    @Published var userList = [UserViewModel]()
    
    private var service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async{
        var resources = ""
        
        switch service.type {
        case "Localservice":
            resources = Constants.Paths.baseUrl
        case "Webservice":
            resources = Constants.Urls.usersExtension
        default:
            resources = Constants.Urls.usersExtension
        }
        
        do {
            let users = try await service.downloadUsers(resources)
            
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
