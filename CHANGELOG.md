# Change Log

## [0.4.1](https://github.com/SparkHub/gs-store-request-id/tree/v0.4.1) (2021-05-13)
[Full Changelog](https://github.com/SparkHub/gs-store-request-id/compare/v0.4.0...v0.4.1)

- Fix security vulnerability (bundler and rake)
- Update gem information (author, email)
- Fix spec constant `ActionDispatch::RequestId::X_REQUEST_ID` not defined

## [0.4.0](https://github.com/SparkHub/gs-store-request-id/tree/v0.4.0) (2019-07-10)
[Full Changelog](https://github.com/SparkHub/gs-store-request-id/compare/v0.3.1...v0.4.0)

** Fix error on incorrect Blue/Green values

The `StoreRequestId.blue_green` was always returning `blue`, regarless on the
value in `X-GS-BGenv` header.

## [0.3.1](https://github.com/SparkHub/gs-store-request-id/tree/v0.3.1) (2019-02-13)
[Full Changelog](https://github.com/SparkHub/gs-store-request-id/compare/v0.3.0...v0.3.1)

** Fix error NameError: uninitialized constant StoreRequestId::BlueGreenMiddleware

## [0.3.0](https://github.com/SparkHub/gs-store-request-id/tree/v0.3.0) (2019-02-08)
[Full Changelog](https://github.com/SparkHub/gs-store-request-id/compare/v0.2.0...v0.3.0)

**Implementing Blue/Green feature**
- New Middleware to manage the Blue/Green feature:
  + Injects new header `X-GS-BGEnv` if doesn't exist: values `blue` (default) or `green`
  + Stores the value of the new header in `StoreRequestId.blue_green`
- Droping support for Ruby < 2.3 and adding support for ruby >= 2.5

## [0.2.0](https://github.com/SparkHub/gs-store-request-id/tree/v0.2.0) (2017-08-14)
[Full Changelog](https://github.com/SparkHub/gs-store-request-id/compare/v0.1.0...v0.2.0)

**Implemented enhancements:**
- Data storage is now configurable ([mchaisse](https://github.com/mchaisse))
- Remove `RequestStore` dependency ([mchaisse](https://github.com/mchaisse))

## [0.1.0](https://github.com/SparkHub/gs-store-request-id/tree/v0.1.0) (2017-08-11)

**Implemented enhancements:**
- Initial version :tada: ([mchaisse](https://github.com/mchaisse))
