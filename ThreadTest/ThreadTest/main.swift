//
//  main.swift
//  ThreadTest
//
//  Created by Peter Pohlmann on 29.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import Foundation


class Threadding: NSObject {

    var val = 0
    let lock = NSLock()
    
    func riseFall(){
    
        (0...5000).forEach { _ in
            lock.lock()
            let v = val + 1
            print(v)
            val = v
            lock.unlock()
        }
    
        
        (0...5000).forEach{ _ in
            lock.lock()
            let v = val - 1
            print(v)
            val = v
            lock.unlock()
        }
    }
    
}

let count  = Threadding()


NSThread.detachNewThreadSelector(#selector(Threadding.riseFall), toTarget: count, withObject: nil)

count.riseFall()

sleep(1)