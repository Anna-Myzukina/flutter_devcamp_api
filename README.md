# flutter_devcamp_api

### API used in progect [jsonplaceholder.typicode.com/posts](https://jsonplaceholder.typicode.com/posts)

> [!TIP]
> [Public APIs](https://github.com/public-apis/public-apis)

## Used Packages

  - [ ] [http](https://pub.dev/packages/http)
  A fundamental package for making HTTP requests in Dart. It offers a composable, multi-platform, Future-based API for sending and receiving data over the web.

  - [ ] [dio](https://pub.dev/packages/dio)
  A powerful HTTP client for Dart, offering features like interceptors, global configuration, FormData, request cancellation, file downloading, timeout, and more.

  - [ ] [retrofit](https://pub.dev/packages/retrofit)
  Inspired by Chopper and Retrofit (for Android), this package simplifies network interactions by generating type-safe clients from Dart interfaces. It leverages source_gen for code generation and works seamlessly with dio for making the actual HTTP calls.

> [!IMPORTANT]
> Important: After defining your Retrofit interfaces, run the following command to generate the client code:

````
dart pub run build_runner build
````

  - [ ] [build_runner](https://pub.dev/packages/build_runner)
  A core package for Dart's build system. It's used to generate code from annotations, such as those used by retrofit and json_serializable

  - [ ] [json_serializable](https://pub.dev/packages/json_serializable)
  A built-in package for converting Dart objects to and from JSON. It integrates with build_runner to generate efficient serialization and deserialization code.

  - [ ] [retrofit_generator](https://pub.dev/packages/retrofit_generator)
  The code generation component specifically designed for the retrofit package. It handles the creation of type-safe clients based on your defined interfaces.

  - [ ] [freezed](https://pub.dev/packages/freezed)
  code generator for data classes, unions, and cloning

  > [!NOTE]
  > To use Freezed, you will need your typical build_runner/code-generator setup.
  
  First, install build_runner and Freezed by adding them to your pubspec.yaml file:

  ````
  flutter pub add freezed_annotation
  flutter pub add dev:build_runner
  flutter pub add dev:freezed
  ````

  #### if using freezed to generate fromJson/toJson, also add:

  ````
  flutter pub add json_annotation
  flutter pub add dev:json_serializable
  ````
