//
//  WorkshopData.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/29/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class Sessions{
    
    //                 //
    //   Youth Track   //
    //                 //
    
    lazy var youthSessionOne = Session(name: "Session One", time: Date(), workshops: Session1Workshops)
    lazy var youthSessionTwo = Session(name: "Session Two", time: Date(), workshops: Session2Workshops)
    lazy var youthSessionThree = Session(name: "Session Three", time: Date(), workshops: Session3Workshops)
   
   let Session1Workshops: [Workshop] = {
        let workshop1 = Workshop(name: "workshop1", title: "The Number One Workshop", time: Date(), description: "The first workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop2 = Workshop(name: "workshop2", title: "The Number Two Workshop", time: Date(), description: "The second workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop3 = Workshop(name: "workshop3", title: "The Number Three Workshop", time: Date(), description: "The third workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop4 = Workshop(name: "workshop4", title: "The Number Four Workshop", time: Date(), description: "The fourth workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop5 = Workshop(name: "workshop5", title: "The Number Five Workshop", time: Date(), description: "The fourth workshop", room: "214", map: UIImage(named: "testimage")!)
        return [workshop1, workshop2, workshop3, workshop4, workshop5]
    }()
    
    let Session2Workshops: [Workshop] = {
        let workshop1 = Workshop(name: "workshop1", title: "The Number One Workshop", time: Date(), description: "The first workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop2 = Workshop(name: "workshop2", title: "The Number Two Workshop", time: Date(), description: "The second workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop3 = Workshop(name: "workshop3", title: "The Number Three Workshop", time: Date(), description: "The third workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop4 = Workshop(name: "workshop4", title: "The Number Four Workshop", time: Date(), description: "The fourth workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop5 = Workshop(name: "workshop5", title: "The Number Five Workshop", time: Date(), description: "The fourth workshop", room: "214", map: UIImage(named: "testimage")!)
        return [workshop1, workshop2, workshop3, workshop4, workshop5]
    }()
    
    let Session3Workshops: [Workshop] = {
        let workshop1 = Workshop(name: "workshop1", title: "The Number One Workshop", time: Date(), description: "The first workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop2 = Workshop(name: "workshop2", title: "The Number Two Workshop", time: Date(), description: "The second workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop3 = Workshop(name: "workshop3", title: "The Number Three Workshop", time: Date(), description: "The third workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop4 = Workshop(name: "workshop4", title: "The Number Four Workshop", time: Date(), description: "The fourth workshop", room: "214", map: UIImage(named: "testimage")!)
        let workshop5 = Workshop(name: "workshop5", title: "The Number Five Workshop", time: Date(), description: "The fourth workshop", room: "214", map: UIImage(named: "testimage")!)
        return [workshop1, workshop2, workshop3, workshop4, workshop5]
    }()
    
    
}


