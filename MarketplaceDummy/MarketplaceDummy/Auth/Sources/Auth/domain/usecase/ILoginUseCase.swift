//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

protocol ILoginUseCase{
    
    func login(username: String, password: String) -> String
}
