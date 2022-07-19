import Foundation

protocol IAuthRepository {
    func login(username: String, password: String) async -> Result<LoginDomainModel, Error>
}
