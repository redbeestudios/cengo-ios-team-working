import Foundation

class AuthMockRepository : IAuthRepository {

    func login(username: String, password: String) async -> Result<LoginDomainModel, Error> {
        return.success(LoginDomainModel(user: User(id: "", firstName: "", lastName: nil, email: nil, age: nil, image: nil), error: ""))
    }

}
