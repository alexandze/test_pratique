//
//  UtilRxSwift.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxSwift

class UtilRxSwift {
    private static var serialDispatchQueueSchedulerForRequestServer: SerialDispatchQueueScheduler?
    
    static public func getSchedulerBackgroundForRequestServer() -> SerialDispatchQueueScheduler {
        guard let queue = serialDispatchQueueSchedulerForRequestServer else {
            let conQueue = DispatchQueue(label: "com.pratique.conQueueRequestServer", attributes: .concurrent)
            
            serialDispatchQueueSchedulerForRequestServer = SerialDispatchQueueScheduler(queue: conQueue, internalSerialQueueName: "com.pratique.conQueueRequestServer")
            
            return serialDispatchQueueSchedulerForRequestServer!
        }

        return queue
    }
    
    static func getSchedulerMain() -> MainScheduler {
        MainScheduler.instance
    }
}
