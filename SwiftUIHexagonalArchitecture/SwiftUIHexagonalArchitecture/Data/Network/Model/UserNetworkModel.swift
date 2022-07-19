import Foundation

struct UserNetworkModel: Decodable {
    let id: String
    let firstName: String
    var lastName: String? = nil
    var email: String? = nil
    var age: Int? = nil
    var image: ImageNetworkModel? = nil
    var password: String? = nil

    func toDomain() -> User {
        User(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            age: age,
            image: image?.toDomain()
        )
    }
}
