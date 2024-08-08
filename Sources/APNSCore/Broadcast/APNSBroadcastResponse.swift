import struct Foundation.UUID

public struct APNSBroadcastResponse<Body: Decodable>: Decodable {
    public let apnsRequestID: UUID?
    public let body: Body

    enum CodingKeys: String, CodingKey {
        case apnsRequestID = "apns-request-id"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apnsRequestID = try container.decodeIfPresent(UUID.self, forKey: .apnsRequestID)
        self.body = try Body(from: decoder)
    }
}