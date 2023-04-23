//
//  UserViewModel.swift
//  NetworkChange
//
//  Created by Emir Türk on 12.04.2023.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userlist = [UserViewModel]()
    
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        var resource = ""
        
        if service.type == "Web" {
            resource = "https://raw.githubusercontent.com/atilsamancioglu/UsersJSONPlaceHolder/main/users.json"
        }
        else {
            resource = "users"
        }
            
        do {
            let users = try await service.download(resource)
            
            DispatchQueue.main.async {
                self.userlist = users.map(UserViewModel.init)
            }
        }
        catch {
            print(error)
        }
    }
    
}






struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
}
