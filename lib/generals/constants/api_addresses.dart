class DumlupinarApiAddresses {
  static const authorization = "92904088708129a45f94296e3588fd51";
  static const String baseUrl = "https://dumlupinargazetesi.com/api/v1";

  static const String companyInfo = '/info';
  static const String categories = '/categories';
  static const String categoryEntries = categories;
  static const String entryData = "/entry/";

  // top_cover
  // cover
  // featured
  static const String sections = "/sections";

  static const String authors = "/authors";
  static const String todayAuthors = "$authors" "/today";

  ///
  /// {
  // "type": "entry",
  // "event": "hit",
  // "id": "20048317" entry id
  // }
  ///
  static const String stats = "/stats";

  //post {
  // "query": "Türkiye ve Dünya Üzerinden"
  // }
  static const String search = "/search";
  static const advertisement = "/advert";
  static const weather = "/service/weather/";
  static const exchange = "/service/exchange";

  static const comments = "/comments";
  static const likeDislikeComment = "/comment";
}
