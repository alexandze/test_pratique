//
//  UtilRxSwift.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxSwift
import Swinject

class Util {
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
    
    static func getCurrentDate() -> String {
        let currentDateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currentDateTime)
    }
    
    static func getContainer() -> Container? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.container
    }
    
    static func getDefaultImage() -> UIImage? {
        let image = UIImage(named: "default-image")
        let imageResized = image?.resizeImage(targetSize: CGSize(width: Constants.DEFAULT_WIDTH_IMAGE, height: Constants.DEFAULT_HEIGHT_IMAGE))
        return imageResized
    }
    
    static func resizeImageWithDefaultDimension(_ image: UIImage) -> UIImage? {
        return image.resizeImage(targetSize: CGSize(width: Constants.DEFAULT_WIDTH_IMAGE, height: Constants.DEFAULT_HEIGHT_IMAGE))
    }
}
