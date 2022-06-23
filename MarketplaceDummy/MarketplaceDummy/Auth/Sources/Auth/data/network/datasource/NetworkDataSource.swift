//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

public class NetworkDataSource: IDataSource {
    
    func sendCredentials(username: String, password: String) -> String{
        print("login flow: step 4 call func sendCredentials from Network Data Source")
        print(username)
        print(password)
        
        return "Ready Again"
    }
}
