import Foundation

struct ImageNetworkModel: Decodable {
    let url: String

    func toDomain() -> NetworkImage? {
        do {
            return NetworkImage(url: try url.asURL())
        } catch {
            return nil
        }
    }
}
