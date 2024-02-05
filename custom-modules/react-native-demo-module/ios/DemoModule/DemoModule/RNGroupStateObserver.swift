//
//  RNGroupStateObserver.swift
//  react-native-demo-module
//
//  Created by David Tong on 04/02/2024.
//

import Foundation
import Combine
import GroupActivities


protocol GroupActivityHandlerDelegate: AnyObject {

    func connectionChanged()
}

class GroupActivityHandler: NSObject {

    private var groupStateObserver = GroupStateObserver()
    var isEligibleForGroupSession: Bool = false

    private weak var delegate: GroupActivityHandlerDelegate?

    var canConnect: Bool {

        return self.isEligibleForGroupSession
    }

    private var subscriptions = Set<AnyCancellable>()
    init(delegate: GroupActivityHandlerDelegate) {

        super.init()
        self.delegate = delegate

        groupStateObserver.$isEligibleForGroupSession.sink { [weak self] isElegibleForGroupSession in

            self?.delegate?.connectionChanged()
            self?.isEligibleForGroupSession = isElegibleForGroupSession
        }
        .store(in: &subscriptions)
    }
}
