//
//  proxy.swift
//
//
//

// Interface of a service
protocol ThirdPartyYoutubeLib {
    mutating func listVideos() -> [String]
}

// Concrete implementation of the service with all
// the methods.
struct ThirdPartyYoutubeClass: ThirdPartyYoutubeLib {
    func listVideos() -> [String] {
        print("Returning videos from api...")
        return ["Music for relax", "Best web challanges", "Funny cats videos"]
    }
}

// A proxy service to cache local data and
// no use the original service when is not necesary.
struct ProxyCachedYoutubeClass: ThirdPartyYoutubeLib {
    init(youtubeService: ThirdPartyYoutubeClass) {
        self.youtubeService = youtubeService
    }

    private let youtubeService: ThirdPartyYoutubeClass

    private var cachedVideos: [String] = []
    var reset: Bool = false

    mutating func listVideos() -> [String] {
        if cachedVideos.isEmpty || reset {
            cachedVideos = youtubeService.listVideos()
            return cachedVideos
        }

        print("Returning videos from cache...")
        return cachedVideos
    }
}

// Demo

let youtubeService = ThirdPartyYoutubeClass()
var proxyYoutube = ProxyCachedYoutubeClass(youtubeService: youtubeService)

print(proxyYoutube.listVideos())
print(proxyYoutube.listVideos())
proxyYoutube.reset = true
print(proxyYoutube.listVideos())

// Here is the result:

// Returning videos from api...
// ["Music for relax", "Best web challanges", "Funny cats videos"]
// Returning videos from cache...
// ["Music for relax", "Best web challanges", "Funny cats videos"]
// Returning videos from api...
// ["Music for relax", "Best web challanges", "Funny cats videos"]
