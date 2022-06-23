//
//  File.swift
//  
//
//  Created by fgsoruco on 23/06/2022.
//

import Foundation

protocol IDataSource {

    func sendCredentials(username: String, password: String) -> String
    
}
