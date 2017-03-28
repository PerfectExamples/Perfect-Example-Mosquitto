// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "mqttConsumer",
    dependencies: [.Package(url:"https://github.com/PerfectlySoft/Perfect-Mosquitto.git", majorVersion: 1)]
)
