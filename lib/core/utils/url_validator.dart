enum UrlError { empty, invalid }

abstract final class UrlValidator {
  UrlValidator._();

  static UrlError? validate(String url) {
    final value = url.trim();
    if (value.isEmpty) return UrlError.empty;

    final uri = Uri.tryParse(value);

    final isValid =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https') && uri.hasAuthority && uri.host.isNotEmpty;
    return isValid ? null : UrlError.invalid;
  }
}
