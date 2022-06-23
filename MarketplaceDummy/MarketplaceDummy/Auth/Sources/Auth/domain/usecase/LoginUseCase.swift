//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

class LoginUseCase: ILoginUseCase {
    
    var loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository){
        self.loginRepository = loginRepository
    }
    
    func login(username: String, password: String) -> String {
        loginRepository.login(username: username, password: password)
    }
}
