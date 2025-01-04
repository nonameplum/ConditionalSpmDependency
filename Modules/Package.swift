// swift-tools-version: 6.0

import Foundation
import PackageDescription

let package = Package(
    name: "ModulesPackage",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "FirebaseUmbrella", targets: ["FirebaseUmbrella"]),
        .library(name: "CoreBluetoothMockUmbrella", targets: ["CoreBluetoothMockUmbrella"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.6.0"),
    ]
    .appending(
        .package(url: "https://github.com/NordicSemiconductor/IOS-CoreBluetooth-Mock.git", from: "0.18.0"),
        if: ProcessInfo.isCoreBluetoothMockEnabled()
    ),
    targets: [
        .target(
            name: "FirebaseUmbrella",
            dependencies: [
                .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalyticsWithoutAdIdSupport", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
            ]
        ),
        .target(
            name: "CoreBluetoothMockUmbrella",
            dependencies: [].appending(
                .product(name: "CoreBluetoothMock", package: "IOS-CoreBluetooth-Mock"),
                if: ProcessInfo.isCoreBluetoothMockEnabled()
            )
        )
    ]
)

extension ProcessInfo {
    private static func isEnvironmentPresent(for key: String) -> Bool {
        ProcessInfo.processInfo.environment[key] != nil
    }

    static func isCoreBluetoothMockEnabled() -> Bool {
        isEnvironmentPresent(for: "CORE_BLUETOOTH_MOCK_ENABLED")
    }
}

extension Array {
    func appending(_ element: Element, if condition: @autoclosure () -> Bool) -> Self {
        if condition() {
            return self + [element]
        }
        return self
    }
}
