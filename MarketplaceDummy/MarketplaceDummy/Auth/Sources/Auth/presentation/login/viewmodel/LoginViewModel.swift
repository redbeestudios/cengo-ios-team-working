//
//  File.swift
//  
//
//  Created by Daniel Bedoya on 6/23/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var result = ""
    
    var loginUseCase: LoginUseCase
    
    init(){
        self.loginUseCase = LoginUseCase(loginRepository: LoginRepository(networkDataSource: NetworkDataSource()))
    }
    
    func login(email: String, password: String){
        let response = loginUseCase.login(username: email, password: password)
        result = response
    }
}
