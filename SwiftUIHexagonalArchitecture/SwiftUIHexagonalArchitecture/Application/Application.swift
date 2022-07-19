import Foundation
import Swinject

@MainActor class Application {
    let loginContainer = Container()
    let loginService: LoginService

    init() {

        loginContainer.register(NetworkConfiguration.self) { _ in
            NetworkConfiguration(baseUrl: "http://localhost:3000")
        }
        loginContainer.register(IAuthRepository.self) { r in
            AuthNetworkRepository(networkConfiguration: r.resolve(NetworkConfiguration.self)!)
//             LoginMockRepository()
        }
        loginContainer.register(LoginService.self) { r in
            LoginService(authRepository: r.resolve(IAuthRepository.self)!)
        }

        loginService = loginContainer.resolve(LoginService.self)!

    }
}
