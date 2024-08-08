public struct APNSBroadcastChannel: APNSMessage, Decodable {
    enum CodingKeys: String, CodingKey {
        case messageStoragePolicy = "message-storage-policy"
        case pushType = "push-type"
    }

    public let messageStoragePolicy: APNSBroadcastMessageStoragePolicy
    public let pushType = APNSPushType.Configuration.liveactivity
}