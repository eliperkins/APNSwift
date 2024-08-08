import struct Foundation.UUID

public struct APNSBroadcastRequest<Message: Encodable> {
    fileprivate final class _Storage {
        var message: Message?
        var apnsRequestID: UUID?
        var channelID: String?

        init(message: Message?, apnsRequestID: UUID?, channelID: String?) {
            self.apnsRequestID = apnsRequestID
            self.channelID = channelID
        }
    }

    public var headers: [String: String] {
        var computedHeaders: [String: String] = [:]

        if let apnsRequestID = apnsRequestID {
            computedHeaders["apns-request-id"] = apnsRequestID.uuidString.lowercased()
        }

        if let channelID = channelID {
            computedHeaders["apns-channel-id"] = channelID
        }

        return computedHeaders
    }

    private var _storage: _Storage

    public init(
        message: Message?,
        apnsRequestID: UUID?,
        channelID: String?
    ) {
        self._storage = _Storage(
            message: message,
            apnsRequestID: apnsRequestID,
            channelID: channelID
        )
    }
}

extension APNSBroadcastRequest._Storage {
    func copy() -> APNSBroadcastRequest._Storage {
        APNSBroadcastRequest._Storage(
            message: message,
            apnsRequestID: apnsRequestID,
            channelID: channelID
        )
    }
}

extension APNSBroadcastRequest {
    public var message: Message? {
        get {
            return self._storage.message
        }
        set {
            if !isKnownUniquelyReferenced(&self._storage) {
                self._storage = self._storage.copy()
            }
            self._storage.message = newValue
        }
    }

    public var apnsRequestID: UUID? {
        get {
            return self._storage.apnsRequestID
        }
        set {
            if !isKnownUniquelyReferenced(&self._storage) {
                self._storage = self._storage.copy()
            }
            self._storage.apnsRequestID = newValue
        }
    }

    public var channelID: String? {
        get {
            return self._storage.channelID
        }
        set {
            if !isKnownUniquelyReferenced(&self._storage) {
                self._storage = self._storage.copy()
            }
            self._storage.channelID = newValue
        }
    }
}
