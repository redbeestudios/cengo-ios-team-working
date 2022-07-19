import Foundation
import Alamofire

class AuthNetworkRepository : IAuthRepository {

    private let configuration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        configuration = networkConfiguration
    }

    var baseUrl: String { get { return "\(configuration.baseUrl)/authentication/login" } }

    func login(username: String, password: String) async -> Result<LoginDomainModel, Error> {

        let params: Parameters = [
            "email": username,
            "password": password
        ]

        return await AF
            .request(
                baseUrl,
                method: .post,
                parameters: params,
                encoding: JSONEncoding.default,
                headers: nil
            )
            .serializingDecodable(LoginNetworkModel.self)
            .result
            .map { resp in resp.toDomain() }
            .mapError { error in error as Error }

    }
}
