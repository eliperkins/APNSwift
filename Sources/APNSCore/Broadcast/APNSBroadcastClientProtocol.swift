import NIOHTTP1

public protocol APNSBroadcastClientProtocol {
    func send<Payload: Decodable>(_ request: APNSBroadcastRequest<some Encodable>) async throws -> APNSBroadcastResponse<Payload>
}

import struct Foundation.UUID

extension APNSBroadcastClientProtocol {
    public func create(channel: APNSBroadcastChannel, apnsRequestID: UUID?) async throws -> APNSBroadcastResponse<APNSBroadcastChannel> {
        let request = APNSBroadcastRequest<APNSBroadcastChannel>(message: channel, apnsRequestID: apnsRequestID, channelID: nil)
        return try await send(request)
    }

    public func read(channelID: String, apnsRequestID: UUID?) async throws -> APNSBroadcastResponse<APNSBroadcastChannel> {
        let request = APNSBroadcastRequest<EmptyPayload?>(message: nil, apnsRequestID: apnsRequestID, channelID: channelID)
        return try await send(request)
    }

    public func delete(channelID: String, apnsRequestID: UUID?) async throws -> APNSBroadcastResponse<EmptyPayload> {
        let request = APNSBroadcastRequest<EmptyPayload?>(message: nil, apnsRequestID: apnsRequestID, channelID: channelID)
        return try await send(request)
    }

    public func readAllChannelIDs(apnsRequestID: UUID?) async throws -> APNSBroadcastResponse<APNSBroadcastChannelList> {
        let request = APNSBroadcastRequest<EmptyPayload?>(message: nil, apnsRequestID: apnsRequestID, channelID: nil)
        return try await send(request)
    }
}
