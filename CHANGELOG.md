# Change Log

## [0.3.0](https://github.com/SparkHub/gs-store-request-id/tree/v0.3.0) (2019-02-08)
[Full Changelog](https://github.com/SparkHub/gs-store-request-id/compare/v0.1.0...v0.2.0)

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
