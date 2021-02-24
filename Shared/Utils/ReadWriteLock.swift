//
//  ReadWriteLock.swift
//  
//
//  Created by Carmelo Ruyman on 18/11/2020.
//

import Foundation

class ReadWriteLock: Hashable {

    static func == (lhs: ReadWriteLock, rhs: ReadWriteLock) -> Bool {
        lhs.concurentQueue.label == rhs.concurentQueue.label
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(concurentQueue.label)
    }

    let concurentQueue: DispatchQueue

    init(label: String) {        
        self.concurentQueue = DispatchQueue(label: label, qos: .background, attributes: .concurrent)
    }

    func read(closure: () -> Void) {
        self.concurentQueue.sync {
            closure()
        }
    }
    func write(closure: @escaping () -> Void) {
        self.concurentQueue.sync(flags: .barrier, execute: {
            closure()
        })
    }
}
