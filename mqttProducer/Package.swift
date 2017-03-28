// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "mqttProducer",
    dependencies: [.Package(url:"https://github.com/PerfectlySoft/Perfect-Mosquitto.git", majorVersion: 1)]
)
