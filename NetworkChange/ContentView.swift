//
//  ContentView.swift
//  NetworkChange
//
//  Created by Emir Türk on 12.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Webservice())
    }
    
    var body: some View {
        List(userListViewModel.userlist,id: \.id) { user in
            
            VStack {
                Text(user.name)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
