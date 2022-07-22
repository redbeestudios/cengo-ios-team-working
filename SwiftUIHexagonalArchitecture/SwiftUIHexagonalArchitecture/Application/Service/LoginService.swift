import Foundation

@MainActor class LoginService : ObservableObject {
    private let authRepository: IAuthRepository

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var response: AuthDomainModel? = nil
    @Published var error: Error? = nil
    @Published var isLoading: Bool = false
    @Published var isSuccessLogin: Bool = false

    init(authRepository: IAuthRepository) {
        self.authRepository = authRepository
    }

    func start() async {
        await login()
    }

    private func login() async {
        isLoading = true

        switch await authRepository.login(
            username: username,
            password: password
        ) {
            case .success(let resp): do {
                self.response = resp

                if (resp.user.id.isEmpty) {
                    self.isSuccessLogin = false
                } else {
                    self.isSuccessLogin = true
                }
            }

            case .failure(let error): do {
                self.error = error
                isSuccessLogin = false
            }

        }

        isLoading = false
    }

    func credentialsAreEmpty() -> Bool {
        username.isEmpty || password.isEmpty
    }
    
}
