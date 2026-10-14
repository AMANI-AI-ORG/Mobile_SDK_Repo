// swift-tools-version:5.3
import PackageDescription

let CoreVersion = "3.7.8"
let CoreChecksum = "d5d9ba80425fce52c2f2f74fd836283ff9fb16669407bb9f4f3bebaae356a5c6"

let VideoVersion = "2.2.0"
let VideoCheckSum = "a8679d735e4fb24f8c2ad0f2ea1cf92e10206f3cd009ec0ba8896366a2ac8d71"

let BioMatchVersion = "1.2.0"
let BioMatchCheckSum = "36e12282ea1671d5e9c34e3a3265715020412552335e0fee6782f19f00241178"

let AmaniSpeechVerifierVersion = "1.0.1"
let AmaniSpeechVerifierCheckSum = "da7be0cc06d2f0dfc2f389881698dfe7a7d149ce747003f994fc8946afc43d3d"

let package = Package(
  name: "AmaniRepo",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "AmaniSDK",
      targets: ["AmaniSDKBundle"]
    ),
    .library(
      name: "AmaniVideoSDK",
      targets: ["AmaniVideoBundle"]
    ),
    .library(
      name: "AmaniBioMatch",
      targets: ["AmaniBioMatchBundle"]
    ),
    .library(
      name: "AmaniSpeechVerifier",
      targets: ["AmaniSpeechVerifierBundle"]
    ),
  ],
  dependencies: [
    .package(
      name: "OpenSSL",
      url: "https://github.com/krzyzanowskim/OpenSSL.git",
      .upToNextMinor(from: "1.1.2300")
    ),
    .package(
      name: "SocketIO",
      url: "https://github.com/socketio/socket.io-client-swift.git",
      .upToNextMinor(from: "16.1.0")
    ),
    .package(
      name: "WebRTC",
      url: "https://github.com/stasel/WebRTC.git",
      .upToNextMinor(from: "127.0.0")
    ),
  ],
  targets: [
    .target(
      name: "AmaniSDKBundle",
      dependencies: [
        "AmaniSDK",
        "OpenSSL"
      ],
      linkerSettings: [
        .linkedFramework("CryptoKit"),
        .linkedFramework("CoreNFC"),
        .linkedFramework("CryptoTokenKit"),
      ]
    ),
    .binaryTarget(
      name: "AmaniSDK",
      url: "https://github.com/AmaniTechnologiesLtd/Public-IOS-SDK/blob/main/Carthage/AmaniSDK/v\(CoreVersion)/AmaniSDK.xcframework.zip?raw=true",
      checksum: "\(CoreChecksum)"
    ),
    .binaryTarget(
      name: "AmaniBioMatch",
      url: "https://github.com/AmaniTechnologiesLtd/Public-IOS-SDK/blob/main/Carthage/AmaniBioMatch/v\(BioMatchVersion)/AmaniBioMatch.xcframework.zip?raw=true",
      checksum: "\(BioMatchCheckSum)"
    ),
    .target(
      name: "AmaniBioMatchBundle",
      dependencies: [
        "AmaniBioMatch"
      ]
    ),
    .binaryTarget(
      name: "AmaniVideoSDK",
      url: "https://github.com/AmaniTechnologiesLtd/Public-IOS-SDK/blob/main/Carthage/AmaniVideoSDK/\(VideoVersion)/AmaniVideoSDK.xcframework.zip?raw=true",
      checksum: "\(VideoCheckSum)"
    ),
    .target(
      name: "AmaniVideoBundle",
      dependencies: [
        "AmaniVideoSDK",
        "SocketIO",
        "WebRTC"
      ]
    ),
    .binaryTarget(
      name: "AmaniSpeechVerifier",
      url: "https://github.com/AmaniTechnologiesLtd/Public-IOS-SDK/blob/main/Carthage/AmaniSpeechVerifier/v\(AmaniSpeechVerifierVersion)/AmaniSpeechVerifier.xcframework.zip?raw=true",
      checksum: AmaniSpeechVerifierCheckSum
    ),
    .target(
      name: "AmaniSpeechVerifierBundle",
      dependencies: [
        "AmaniSpeechVerifier"
      ]
    )
  ]
)
