//
//  ApplicationLoadingIndicatorManager.swift
//  ThunderRequest
//
//  Created by Simon Mitchell on 13/04/2016.
//  Copyright © 2016 threesidedcube. All rights reserved.
//

import UIKit

public class ApplicationLoadingIndicatorManager: NSObject {
    
    public static let sharedManager = ApplicationLoadingIndicatorManager()
    private var activityCount = 0
        
    public func showActivityIndicator() {
        
        objc_sync_enter(self)
        if activityCount == 0 {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        }
        activityCount += 1
        objc_sync_exit(self)
    }
    
    public func hideActivityIndicator() {
        
        objc_sync_enter(self)
        activityCount -= 1
        if activityCount <= 0 {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        objc_sync_exit(self)
    }
}
