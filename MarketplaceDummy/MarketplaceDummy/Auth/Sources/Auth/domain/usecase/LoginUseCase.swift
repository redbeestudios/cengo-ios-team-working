//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

public class LoginUseCase: ILoginUseCase {
    
    var loginRepository: ILoginRepository
    
    init(loginRepository: ILoginRepository){
        self.loginRepository = loginRepository
    }
    
    func login(username: String, password: String) -> String {
        print("login flow: step 2 call func login from LoginUseCase")
        return loginRepository.login(username: username, password: password)
    }
}
