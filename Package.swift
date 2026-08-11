// swift-tools-version:5.3
import PackageDescription

let CoreVersion = "3.7.3-test5"
let CoreChecksum = "fac254cc2b8f6c7e8ebe3448f61855387b496c0f308b88694013a802571453fe"

let VideoVersion = "2.0.7test"
let VideoCheckSum = "d2c18d819019eb726e2a96646caf6898abf45627a1689d8a3dffff116680c61f"

let BioMatchVersion = "1.2.0"
let BioMatchCheckSum = "36e12282ea1671d5e9c34e3a3265715020412552335e0fee6782f19f00241178"

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
            name:"AmaniVideoSDK",
            targets: ["AmaniVideoBundle"]
        ),
        .library(
            name: "AmaniBioMatch",
            targets: ["AmaniBioMatchBundle"]
        )
    ],
    dependencies: [
        .package(
            name: "OpenSSL",
            url: "https://github.com/krzyzanowskim/OpenSSL.git",
            .upToNextMinor(from: "1.1.2300")
        ),
        .package(
            name: "SocketIO",
            url:    "https://github.com/socketio/socket.io-client-swift.git",
            .upToNextMinor(from: "16.1.0")
        ),
        .package(
            name:   "WebRTC",
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
            linkerSettings:[
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
	
    ]
)

