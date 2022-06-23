//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

public class LoginRepository: ILoginRepository {

    var dataSource: IDataSource
    
    init(dataSource: IDataSource){
        self.dataSource = dataSource
    }
    
    func login(username: String, password: String) -> String {
        print("login flow: step 3 call func login from Repository")
        return dataSource.sendCredentials(username: username, password: password)
    }
    
}
