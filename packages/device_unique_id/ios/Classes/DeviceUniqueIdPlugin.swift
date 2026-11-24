import Flutter
import Security
import UIKit

public class DeviceUniqueIdPlugin: NSObject, FlutterPlugin {
  private let keychainService = "com.app.device_unique_id"
  private let keychainAccount = "device_unique_id"

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "device_unique_id",
      binaryMessenger: registrar.messenger()
    )
    let instance = DeviceUniqueIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getDeviceId" {
      result(getOrCreatePersistentDeviceId())
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func getOrCreatePersistentDeviceId() -> String {
    if let existing = readFromKeychain(), !existing.isEmpty {
      return existing
    }
    let newId = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
    saveToKeychain(newId)
    return newId
  }

  private func readFromKeychain() -> String? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: keychainService,
      kSecAttrAccount as String: keychainAccount,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne
    ]
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    guard status == errSecSuccess, let data = item as? Data else {
      return nil
    }
    return String(data: data, encoding: .utf8)
  }

  private func saveToKeychain(_ value: String) {
    guard let data = value.data(using: .utf8) else { return }
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: keychainService,
      kSecAttrAccount as String: keychainAccount
    ]
    SecItemDelete(query as CFDictionary)

    var attributes = query
    attributes[kSecValueData as String] = data
    attributes[kSecAttrAccessible as String] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
    SecItemAdd(attributes as CFDictionary, nil)
  }
}
