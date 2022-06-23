//
//  File.swift
//  
//
//  Created by fgsoruco on 23/06/2022.
//

import Foundation

public class LocalDataSource: IDataSource {

    func sendCredentials(username: String, password: String) -> String{
        print("login flow: step 4 call func sendCredentials from Local Data Source")
        print(username)
        print(password)

        return "Ready Again"
    }

}
