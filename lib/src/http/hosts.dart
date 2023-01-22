class StatefulHost {
  StatefulHost(this.url);

  final String url;
  var isUp = true;
  var retryCount = 0;
  var lastUpdate = DateTime.now();

  void reset() {
    isUp = true;
    retryCount = 0;
    lastUpdate = DateTime.now();
  }

  void timedOut() {
    isUp = true;
    retryCount += 1;
    lastUpdate = DateTime.now();
  }

  void failed() {
    isUp = false;
    lastUpdate = DateTime.now();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatefulHost &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          isUp == other.isUp &&
          lastUpdate == other.lastUpdate &&
          retryCount == other.retryCount;

  @override
  int get hashCode =>
      url.hashCode ^ isUp.hashCode ^ lastUpdate.hashCode ^ retryCount.hashCode;

  @override
  String toString() =>
      'StatefulHost{url: $url, isUp: $isUp, lastUpdate: $lastUpdate, retryCount: $retryCount}';
}
