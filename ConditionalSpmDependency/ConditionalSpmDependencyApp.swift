import SwiftUI
import Firebase
import FirebaseAuth
#if canImport(CoreBluetoothMock)
import CoreBluetoothMock
#endif

@main
struct ConditionalSpmDependencyApp: App {
    var body: some Scene {
        WindowGroup {
#if canImport(CoreBluetoothMock)
            Text("✅ CoreBluetoothMock available")
                .onAppear {
                    CBMCentralManagerMock.simulateInitialState(.poweredOn)
                }
#else
            Text("🛑 CoreBluetoothMock not available")
#endif
        }
    }
}
