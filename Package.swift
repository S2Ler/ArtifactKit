// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "ArtifactKit",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
  ],
  products: [
    .library(
      name: "ArtifactKit",
      targets: ["ArtifactKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/diejmon/Networker.git", .branch("master"))
  ],
  targets: [
    .target(
      name: "ArtifactKit",
      dependencies: ["Networker"]),
    .testTarget(
      name: "ArtifactKitTests",
      dependencies: ["ArtifactKit"]),
  ]
)
