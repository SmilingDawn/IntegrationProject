//
//  NativeScreenMoveManager.swift
//  IntegrationProject
//
//  Created by jongmin.lee on 2022/08/04.
//

import Foundation
import OSLog

@objc(NativeCounterManager)
class NativeCounterManager: NSObject {
  private var count = 0
  
  @objc(sendValue:)
  func sendValue(value: String) -> Void {
    os_log("sendValue value : \(value)")
  }
  
  @objc(sendValueInt:)
  func sendValueInt(value: Int) -> Void {
    os_log("sendValueInt value: \(value)")
  }
  
  @objc(addEvent:location:date:)
  func addEvent(name: String, location: String, date: NSNumber) -> Void{
    os_log("addEvent name: \(name)")
  }
  
  @objc
  func increment(_ callback: RCTResponseSenderBlock) {
    count += 1
    callback([count])
  }
  
  @objc
  func decrement(_ resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    if (count == 0) {
      let error = NSError(domain: "", code: 200, userInfo: nil)
      reject("ERROR_COUNT", "count cannot be negative", error)
    } else {
      count -= 1
      resolve("count is \(count)")
    }
  }
  
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
