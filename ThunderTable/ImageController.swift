//
//  ImageController.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 06/10/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import Foundation

public typealias ImageRequestCompletion = (_ image: UIImage?,_ error: Error?,_ request: ImageRequest?) -> Void

///  A controller which helps with the loading and caching of images from sources other than the app's bundle
open class ImageController {
    
    /// The shared singleton of the image controller
    public static let shared: ImageController = ImageController()
    
    /// The operation queue that contains all requests added to a default session
    private let defaultRequestQueue: OperationQueue
    
    /// The url session for loading images on
    private let defaultSession: URLSession
    
    private init() {
        
        defaultRequestQueue = OperationQueue()

        let defaultConfig = URLSessionConfiguration.default
        defaultSession = URLSession(configuration: defaultConfig, delegate: nil, delegateQueue: defaultRequestQueue)
        
        let urlCache = URLCache(memoryCapacity: 50 * 1024 * 1024, diskCapacity: 500 * 1024 * 1024, diskPath: nil)
        defaultSession.configuration.urlCache = urlCache
        defaultSession.configuration.requestCachePolicy = .returnCacheDataElseLoad
    }
    
    /// Loads a UIImage for an image at a certain url
    ///
    /// Once the request has completed the image data will be stored in an NSCache for quicker loading the next time the image from this URL is needed
    /// - parameter fromURL:    The url to get the image from
    /// - parameter completion: A closure called once the image has been pulled from the given URL
    ///
    /// - returns: Returns the image request that will be performed
    open func loadImage(fromURL: URL, completion: ImageRequestCompletion?) -> ImageRequest {
        
        let request = ImageRequest(url: fromURL)
        request.urlRequest.cachePolicy = .returnCacheDataElseLoad
        return schedule(request: request, withCompletion: completion)
    }
    
    private func schedule(request: ImageRequest, withCompletion: ImageRequestCompletion?) -> ImageRequest {
        
        ApplicationLoadingIndicatorManager.sharedManager.showActivityIndicator()
        
        request.dataTask = defaultSession.dataTask(with: request.urlRequest, completionHandler: { (data, response, error) in

            ApplicationLoadingIndicatorManager.sharedManager.hideActivityIndicator()

            guard let data = data else {
                
                OperationQueue.main.addOperation {
                    
                    if let error = error {
                        withCompletion?(nil, error, request)
                    } else {
                        withCompletion?(nil, ImageControllerError.loadFailed, request)
                    }
                }
                return
            }
            
            guard let image = UIImage(data: data, scale: UIScreen.main.scale) else {
                
                OperationQueue.main.addOperation {
                    withCompletion?(nil, ImageControllerError.invalidData, request)
                }
                return
            }
            
            OperationQueue.main.addOperation {
                withCompletion?(image, nil, request)
            }
        })
        
        request.dataTask?.resume()
        return request
    }
    
    /// Cancels a currently running request operation
    ///
    /// - parameter imageRequest: The request to cancel
    open func cancel(imageRequest: ImageRequest) {
        imageRequest.dataTask?.cancel()
    }
}

public enum ImageControllerError: Error {
    case loadFailed
    case invalidData
}

/// A containing representation of a `URLRequest` and the dataTask that was created from it
public class ImageRequest {
    
    /// The `URLRequest` of the request
    var urlRequest: URLRequest
    
    /// The dataTask that was initialised for the request
    var dataTask: URLSessionDataTask?
    
    init(url: URL) {
        urlRequest = URLRequest(url: url)
    }
}
