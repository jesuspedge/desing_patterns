/// Interface of a service
abstract interface class ThirdPartyYoutubeLib {
  List<String> listVideos();
}

/// Concrete implementation of the service with all
/// the mothods.
class ThirdPartyYoutubeClass implements ThirdPartyYoutubeLib {
  @override
  List<String> listVideos() {
    print('Returning videos from api...');
    return ['Music for relax', 'Best web challanges', 'Funny cats videos'];
  }
}

/// A proxy service to cache local data and
/// no use the original service when is not necesary.
class ProxyCachedYoutubeClass implements ThirdPartyYoutubeLib {
  ProxyCachedYoutubeClass({required ThirdPartyYoutubeClass youtubeService})
      : _youtubeService = youtubeService;

  final ThirdPartyYoutubeClass _youtubeService;

  List<String> _cachedVideos = [];
  bool reset = false;

  @override
  List<String> listVideos() {
    if (_cachedVideos.isEmpty || reset) {
      _cachedVideos = _youtubeService.listVideos();
      return _cachedVideos;
    }

    print('Returning videos from cache...');
    return _cachedVideos;
  }
}

void main() {
  final youtubeService = ThirdPartyYoutubeClass();
  final proxyYoutube = ProxyCachedYoutubeClass(youtubeService: youtubeService);

  print(proxyYoutube.listVideos());
  print(proxyYoutube.listVideos());
  proxyYoutube.reset = true;
  print(proxyYoutube.listVideos());

  /// Here is the result:
  /*
  Returning videos from api...
  [Music for relax, Best web challanges, Funny cats videos]
  Returning videos from cache...
  [Music for relax, Best web challanges, Funny cats videos]
  Returning videos from api...
  [Music for relax, Best web challanges, Funny cats videos]
  */
}
