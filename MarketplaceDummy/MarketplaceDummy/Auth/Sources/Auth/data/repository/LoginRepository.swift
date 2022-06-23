//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

class LoginRepository: ILoginRepository {

    var networkDataSource: NetworkDataSource
    
    init(networkDataSource: NetworkDataSource){
        self.networkDataSource = networkDataSource
    }
    
    func login(username: String, password: String) -> String {
        return networkDataSource.sendCredentials(username: username, password: password)
    }
    
}
