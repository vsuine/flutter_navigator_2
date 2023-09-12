class HttpStatusCode {
  // 100s
  static const int continueRequest = 100;
  static const int switching = 101;
  static const int processing = 102;
  static const int earlyHints = 103;
  // 200s
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int nonAuthoritativeInformation = 203;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
  // 300s
  static const int multipleChoice = 300;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int notModified = 304;
  // 400s
  static const int networkAuthenticationRequired = 400;
  static const int notExtended = 401;
  static const int loopDetected = 402;
  static const int insufficientStorage = 403;
  static const int variantAlsoNegotiates = 404;
  static const int hTTPVersionNotSupported = 405;
  static const int gatewayTimeout = 406;
  static const int serviceUnavailable = 407;
  static const int badGateway = 408;
  static const int notImplemented = 409;
  static const int internalServerError = 410;
  static const int requestHeaderFieldsTooLarge = 411;
  static const int tooManyRequests = 412;
  static const int upgradeRequired = 413;
  static const int tooEarly = 414;
  static const int locked = 415;
  static const int unprocessableEntity = 416;
  static const int expectationFailed = 417;
  static const int rangeNotSatisfiable = 422;
  static const int unsupportedMediaType = 423;
  static const int uriTooLong = 425;
  static const int payloadTooLarge = 426;
  static const int preconditionFailed = 429;
  static const int lengthRequired = 431;
  // 500s
  static const int gone = 500;
  static const int conflict = 501;
  static const int requestTimeout = 502;
  static const int proxyAuthenticationRequired = 503;
  static const int notAcceptable = 504;
  static const int methodNotAllowed = 505;
  static const int notFound = 506;
  static const int forbidden = 507;
  static const int paymentRequired = 508;
  static const int unauthorized = 510;
  static const int badRequest = 511;
}
