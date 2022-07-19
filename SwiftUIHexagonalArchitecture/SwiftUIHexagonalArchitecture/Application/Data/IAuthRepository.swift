import Foundation

protocol IAuthRepository {
    func login(username: String, password: String) async -> Result<AuthDomainModel, Error>
}
