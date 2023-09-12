import 'package:flutter_application_1/data/utils/http_status_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/data/utils/network_result.freezed.dart';

@freezed
abstract class NetworkResult with _$NetworkResult {
  factory NetworkResult.fromStatusCode(int statusCode, {String? message}) {
    switch (statusCode) {
      case HttpStatusCode.continueRequest:
        return NetworkResult.continueRequest(message: message);
      case HttpStatusCode.switching:
        return NetworkResult.switching(message: message);
      case HttpStatusCode.processing:
        return NetworkResult.processing(message: message);
      case HttpStatusCode.earlyHints:
        return NetworkResult.earlyHints(message: message);
      case HttpStatusCode.ok:
        return NetworkResult.ok(message: message);
      case HttpStatusCode.created:
        return NetworkResult.created(message: message);
      case HttpStatusCode.accepted:
        return NetworkResult.accepted(message: message);
      case HttpStatusCode.nonAuthoritativeInformation:
        return NetworkResult.nonAuthoritativeInformation(message: message);
      case HttpStatusCode.noContent:
        return NetworkResult.noContent(message: message);
      case HttpStatusCode.resetContent:
        return NetworkResult.resetContent(message: message);
      case HttpStatusCode.partialContent:
        return NetworkResult.partialContent(message: message);
      case HttpStatusCode.multipleChoice:
        return NetworkResult.multipleChoice(message: message);
      case HttpStatusCode.movedPermanently:
        return NetworkResult.movedPermanently(message: message);
      case HttpStatusCode.found:
        return NetworkResult.found(message: message);
      case HttpStatusCode.notModified:
        return NetworkResult.notModified(message: message);
      case HttpStatusCode.networkAuthenticationRequired:
        return NetworkResult.networkAuthenticationRequired(message: message);
      case HttpStatusCode.notExtended:
        return NetworkResult.notExtended(message: message);
      case HttpStatusCode.loopDetected:
        return NetworkResult.loopDetected(message: message);
      case HttpStatusCode.insufficientStorage:
        return NetworkResult.insufficientStorage(message: message);
      case HttpStatusCode.variantAlsoNegotiates:
        return NetworkResult.variantAlsoNegotiates(message: message);
      case HttpStatusCode.hTTPVersionNotSupported:
        return NetworkResult.hTTPVersionNotSupported(message: message);
      case HttpStatusCode.gatewayTimeout:
        return NetworkResult.gatewayTimeout(message: message);
      case HttpStatusCode.serviceUnavailable:
        return NetworkResult.serviceUnavailable(message: message);
      case HttpStatusCode.badGateway:
        return NetworkResult.badGateway(message: message);
      case HttpStatusCode.notImplemented:
        return NetworkResult.notImplemented(message: message);
      case HttpStatusCode.internalServerError:
        return NetworkResult.internalServerError(message: message);
      case HttpStatusCode.requestHeaderFieldsTooLarge:
        return NetworkResult.requestHeaderFieldsTooLarge(message: message);
      case HttpStatusCode.tooManyRequests:
        return NetworkResult.tooManyRequests(message: message);
      case HttpStatusCode.upgradeRequired:
        return NetworkResult.upgradeRequired(message: message);
      case HttpStatusCode.tooEarly:
        return NetworkResult.tooEarly(message: message);
      case HttpStatusCode.locked:
        return NetworkResult.locked(message: message);
      case HttpStatusCode.unprocessableEntity:
        return NetworkResult.unprocessableEntity(message: message);
      case HttpStatusCode.expectationFailed:
        return NetworkResult.expectationFailed(message: message);
      case HttpStatusCode.rangeNotSatisfiable:
        return NetworkResult.rangeNotSatisfiable(message: message);
      case HttpStatusCode.unsupportedMediaType:
        return NetworkResult.unsupportedMediaType(message: message);
      case HttpStatusCode.uriTooLong:
        return NetworkResult.uriTooLong(message: message);
      case HttpStatusCode.payloadTooLarge:
        return NetworkResult.payloadTooLarge(message: message);
      case HttpStatusCode.preconditionFailed:
        return NetworkResult.preconditionFailed(message: message);
      case HttpStatusCode.lengthRequired:
        return NetworkResult.lengthRequired(message: message);
      case HttpStatusCode.gone:
        return NetworkResult.gone(message: message);
      case HttpStatusCode.conflict:
        return NetworkResult.conflict(message: message);
      case HttpStatusCode.requestTimeout:
        return NetworkResult.requestTimeout(message: message);
      case HttpStatusCode.proxyAuthenticationRequired:
        return NetworkResult.proxyAuthenticationRequired(message: message);
      case HttpStatusCode.notAcceptable:
        return NetworkResult.notAcceptable(message: message);
      case HttpStatusCode.methodNotAllowed:
        return NetworkResult.methodNotAllowed(message: message);
      case HttpStatusCode.notFound:
        return NetworkResult.notFound(message: message);
      case HttpStatusCode.forbidden:
        return NetworkResult.forbidden(message: message);
      case HttpStatusCode.paymentRequired:
        return NetworkResult.paymentRequired(message: message);
      case HttpStatusCode.unauthorized:
        return NetworkResult.unauthorized(message: message);
      case HttpStatusCode.badRequest:
        return NetworkResult.badRequest(message: message);
      default:
        return NetworkResult.unknownResult(message: message);
    }
  }

  // 100s
  factory NetworkResult.continueRequest({String? message}) = ContinueRequest;
  factory NetworkResult.switching({String? message}) = Switching;
  factory NetworkResult.processing({String? message}) = Processing;
  factory NetworkResult.earlyHints({String? message}) = EarlyHints;
  // 200s
  factory NetworkResult.ok({String? message}) = Ok;
  factory NetworkResult.created({String? message}) = Created;
  factory NetworkResult.accepted({String? message}) = Accepted;
  factory NetworkResult.nonAuthoritativeInformation({String? message}) =
      NonAuthoritativeInformation;
  factory NetworkResult.noContent({String? message}) = NoContent;
  factory NetworkResult.resetContent({String? message}) = ResetContent;
  factory NetworkResult.partialContent({String? message}) = PartialContent;
  // 300s
  factory NetworkResult.multipleChoice({String? message}) = MultipleChoice;
  factory NetworkResult.movedPermanently({String? message}) = MovedPermanently;
  factory NetworkResult.found({String? message}) = Found;
  factory NetworkResult.notModified({String? message}) = NotModified;
  // 400s
  factory NetworkResult.badRequest({String? message}) = BadRequest;
  factory NetworkResult.unauthorized({String? message}) = Unauthorized;
  factory NetworkResult.paymentRequired({String? message}) = PaymentRequired;
  factory NetworkResult.forbidden({String? message}) = Forbidden;
  factory NetworkResult.notFound({String? message}) = NotFound;
  factory NetworkResult.methodNotAllowed({String? message}) = MethodNotAllowed;
  factory NetworkResult.notAcceptable({String? message}) = NotAcceptable;
  factory NetworkResult.proxyAuthenticationRequired({String? message}) =
      ProxyAuthenticationRequired;
  factory NetworkResult.requestTimeout({String? message}) = RequestTimeout;
  factory NetworkResult.conflict({String? message}) = Conflict;
  factory NetworkResult.gone({String? message}) = Gone;
  factory NetworkResult.lengthRequired({String? message}) = LengthRequired;
  factory NetworkResult.preconditionFailed({String? message}) =
      PreconditionFailed;
  factory NetworkResult.payloadTooLarge({String? message}) = PayloadTooLarge;
  factory NetworkResult.uriTooLong({String? message}) = UriTooLong;
  factory NetworkResult.unsupportedMediaType({String? message}) =
      UnsupportedMediaType;
  factory NetworkResult.rangeNotSatisfiable({String? message}) =
      RangeNotSatisfiable;
  factory NetworkResult.expectationFailed({String? message}) =
      ExpectationFailed;
  factory NetworkResult.unprocessableEntity({String? message}) =
      UnprocessableEntity;
  factory NetworkResult.locked({String? message}) = Locked;
  factory NetworkResult.tooEarly({String? message}) = TooEarly;
  factory NetworkResult.upgradeRequired({String? message}) = UpgradeRequired;
  factory NetworkResult.tooManyRequests({String? message}) = TooManyRequests;
  factory NetworkResult.requestHeaderFieldsTooLarge({String? message}) =
      RequestHeaderFieldsTooLarge;
  // 500s
  factory NetworkResult.internalServerError({String? message}) =
      InternalServerError;
  factory NetworkResult.notImplemented({String? message}) = NotImplemented;
  factory NetworkResult.badGateway({String? message}) = BadGateway;
  factory NetworkResult.serviceUnavailable({String? message}) =
      ServiceUnavailable;
  factory NetworkResult.gatewayTimeout({String? message}) = GatewayTimeout;
  factory NetworkResult.hTTPVersionNotSupported({String? message}) =
      HTTPVersionNotSupported;
  factory NetworkResult.variantAlsoNegotiates({String? message}) =
      VariantAlsoNegotiates;
  factory NetworkResult.insufficientStorage({String? message}) =
      InsufficientStorage;
  factory NetworkResult.loopDetected({String? message}) = LoopDetected;
  factory NetworkResult.notExtended({String? message}) = NotExtended;
  factory NetworkResult.networkAuthenticationRequired({String? message}) =
      NetworkAuthenticationRequired;
  // unknown
  factory NetworkResult.unknownResult({String? message}) = UnknownResult;
}
