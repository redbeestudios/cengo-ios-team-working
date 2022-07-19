import Foundation

struct AuthNetworkModel: Decodable {
    let token: String?
    let user: UserNetworkModel?
    let statusCode: Int?
    let message: String?
    let error: String?

    func toDomain() -> AuthDomainModel {
        AuthDomainModel(
            user: User(
                id: token ?? "",
                firstName: user?.firstName ?? "",
                lastName: nil,
                email: nil,
                age: nil,
                image: nil
            ),
            error: message ?? ""
        )
    }
}
