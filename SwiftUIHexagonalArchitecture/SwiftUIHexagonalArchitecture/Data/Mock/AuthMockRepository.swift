import Foundation

class AuthMockRepository : IAuthRepository {

    func login(username: String, password: String) async -> Result<AuthDomainModel, Error> {
        return.success(AuthDomainModel(user: User(id: "", firstName: "", lastName: nil, email: nil, age: nil, image: nil), error: ""))
    }

}
