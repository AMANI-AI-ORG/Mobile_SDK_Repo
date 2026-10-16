// swift-tools-version:5.3
import PackageDescription

let CoreVersion = "3.7.9"
let CoreChecksum = "36f7521bdfdb44791024c580e46999841df938b9bdf621f43e8de4abf430a565"

let VideoVersion = "2.2.0"
let VideoCheckSum = "a8679d735e4fb24f8c2ad0f2ea1cf92e10206f3cd009ec0ba8896366a2ac8d71"

let BioMatchVersion = "1.2.0"
let BioMatchCheckSum = "36e12282ea1671d5e9c34e3a3265715020412552335e0fee6782f19f00241178"

let AmaniSpeechVerifierVersion = "1.0.3"
let AmaniSpeechVerifierCheckSum = "7c0a64822d94500074fca009c145c3a995ed14125122144e7c463906c89d234e"

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
