//
//  RNGroupStateObserver.swift
//  react-native-demo-module
//
//  Created by David Tong on 04/02/2024.
//

import Foundation
import Combine
import GroupActivities

@objc
public class GroupActivityHandler: NSObject {

    private var groupStateObserver = GroupStateObserver()
    @objc public var isEligibleForGroupSession: Bool = false

    var canConnect: Bool {

        return self.isEligibleForGroupSession
    }

    private var subscriptions = Set<AnyCancellable>()
    
    @objc public func subscriberEligibleForGroupSession( _ withCompletionHandler: @escaping (Bool) -> Void) {
        groupStateObserver.$isEligibleForGroupSession.sink { [weak self] isElegibleForGroupSession in
            
            self?.isEligibleForGroupSession = isElegibleForGroupSession
            withCompletionHandler(isElegibleForGroupSession)
        }
        .store(in: &subscriptions)
    }
}
