//
//  Reachability.swift
//  CheckNetWork
//
//  Created by Admin on 7/17/17.
//  Copyright © 2017 ChungSama. All rights reserved.
//

import Foundation
import SystemConfiguration

public enum ReachabilityError: Error {
    case FailedToCreateWithAddress(sockaddr_in) //Socket address, internet style.
    case FailedToCreateHostName
    case UnableToSetCallBack
    case UnabelToSetDispatchQueue
}

public let ReachabilityChangedNotification = NSNotification.Name("ReachabilityChangedNotification")

func callback(reachability: SCNetworkReachability, flags: SCNetworkConnectionFlags, info: UnsafeMutableRawPointer?) {
    guard let info = info else {
        return
    }
    let reachability = Unmanaged<Reachability>.fromOpaque(info).takeUnretainedValue()
    DispatchQueue.main.async {
        reachability.reachabilityChanged()
    }
}

public class Reachability {
    fileprivate var reachabilityRef = SCNetworkReachability
}

fileprivate extension Reachability {
    var reachabilityFlags: SCNetworkConnectionFlags {
        guard let reachabilityRef = reachabilityRef else {
            return SCNetworkConnectionFlags()
        }
        var flags = SCNetworkConnectionFlags()
        let gotFlags = withUnsafePointer(to: &flags) { (<#UnsafePointer<T>#>) -> Result in
            <#code#>
        }
    }
    func reachabilityChanged() {
        let flags =
    }
}
