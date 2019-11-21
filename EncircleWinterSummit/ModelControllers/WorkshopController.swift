//
//  WorkshopController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/6/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class WorkshopController  {
    
    //MARK - singleton
    static let shared = WorkshopController()
    //MARK - Properties
    var workshopsForTrack: [[Workshop]] = []
    var openingSessionTime = WorkshopController.shared.setWorkshopTime(hour: 12, minute: 15)
    var youthSharedSessionTime = WorkshopController.shared.setWorkshopTime(hour: 13, minute: 30)
    var sessionOneTime = WorkshopController.shared.setWorkshopTime(hour: 14, minute: 30)
    var sessionTwoTime = WorkshopController.shared.setWorkshopTime(hour: 15, minute: 30)
    var sessionThreeTime = WorkshopController.shared.setWorkshopTime(hour: 16, minute: 30)
    var dinnerSessionTime = WorkshopController.shared.setWorkshopTime(hour: 17, minute: 30)
    var closingSessionTime = WorkshopController.shared.setWorkshopTime(hour: 18, minute: 00)
    
    //MARK - Functions
    
    func setWorkshopTime(hour: Int, minute: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 12
        dateComponents.day = 7
        dateComponents.timeZone = TimeZone(abbreviation: "MST")
        dateComponents.hour = hour
        dateComponents.minute = minute
    
        let calender = Calendar.current
        guard let date = calender.date(from: dateComponents) else {return Date()}
        return date
    }
    
    func setWorkshopsForTrack(){
        switch UserController.shared.currentUser?.trackPreference {
        case .youth:
            workshopsForTrack = youthWorkshops
        case .youngAdult:
            workshopsForTrack = youngAdultWokshops
        case .adult:
            workshopsForTrack = adultWorkhops
        case .parent:
            workshopsForTrack = parentWorkshops
        case .educator:
            workshopsForTrack = educatorWorkshops
        default:
            print("This should never print  !!!!!!")
        }
        
        print("😩😩😩😩😩workshops for track got changed to \(UserController.shared.currentUser?.trackPreference)😩😩😩😩😩😩😩😩😩😩")
    }
    
    //Intro and Outro Workshops
    static var youthIntroAndOutroWorkshops: [Workshop] {
        let openeingSession = Workshop(name: "Opening Workshop", title: "Opening Workshop", time: Date(), description: "Make sure you get there early and find your seat! You won't want to miss this one!", room: "Main room", map: Data())
        let dinner = Workshop(name: "Dinner", title: "Dinner", time: Date(), description: "The moment you've all been waiting for!", room: "Room", map: Data())
        let closingSession = Workshop(name: "Closing Session", title: "Closing Session", time: Date(), description: "Grab a seat and get ready for an amazing show featuring performances and speakers", room: "Room", map: Data())
        return [openeingSession, dinner, closingSession]
    }
    
    static var adultIntroAndOutroWorkshops: [Workshop] {
        let openeingSession = Workshop(name: "Opening Workshop", title: "Opening Workshop", time: Date(), description: "Make sure you get there early and find your seat! You won't want to miss this one!", room: "Main room", map: Data())
              let dinner = Workshop(name: "Dinner", title: "Dinner", time: Date(), description: "The moment you've all been waiting for!", room: "Room", map: Data())
              let closingSession = Workshop(name: "Closing Session", title: "Closing Session", time: Date(), description: "Grab a seat and get ready for an amazing show featuring performances and speakers", room: "Room", map: Data())
              return [openeingSession, dinner, closingSession]
    }
    
    
    //YOUTH WORKSHOPS
    var youthWorkshops: [[Workshop]] {
        var youthWorkshop1: [Workshop] {
             let openeingSession = Workshop(name: "Opening Workshop", title: "Opening Workshop", time: Date(), description: "Make sure you get there early and find your seat! You won't want to miss this one!", room: "Main room", map: Data())
                      let dinner = Workshop(name: "Dinner", title: "Dinner", time: Date(), description: "The moment you've all been waiting for!", room: "Room", map: Data())
                      let closingSession = Workshop(name: "Closing Session", title: "Closing Session", time: Date(), description: "Grab a seat and get ready for an amazing show featuring performances and speakers", room: "Room", map: Data())
                      return [openeingSession, dinner, closingSession]
        }
        var youthWorkshop2: [Workshop] {
            return[]
        }
        var youthWorkshop3: [Workshop] {
            return[]
        }
        var youthWorkshop4: [Workshop] {
            return[]
        }
        return[youthWorkshop1, youthWorkshop2, youthWorkshop3, youthWorkshop4]
    }
    
    
    
    //YOUNG ADULT WORKSHOPS
    var youngAdultWokshops: [[Workshop]]{
        var youngAdultWorkshop1: [Workshop] {
            return[]
        }
        var youngAdultWorkshop2: [Workshop] {
            return[]
        }
        var youngAdultWorkshop3: [Workshop] {
            return[]
        }
        var youngAdultWorkshop4: [Workshop] {
            return[]
        }
        return[youngAdultWorkshop1, youngAdultWorkshop2, youngAdultWorkshop3, youngAdultWorkshop4]
    }
    
    
    //ADULT WORKSHOPS
    var  adultWorkhops: [[Workshop]]{
        var adultWorkshop1: [Workshop] {
            let workshop1 = Workshop(name: "Workshop 1", title: "Cultural Identity's Impact on Health", time: sessionOneTime, description: "cultural identity and how it influences the 5 main aspects of personal health, which are emotional, occupational, intellectual, social community environment, physical fitness nutrition, spiritual values ethics.", room: "429", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop2 = Workshop(name: "Workshop 1", title: "Bearing Your Journey (Without Murmuring)", time: sessionOneTime, description: "The journey of an LGBT Saint in the Church of Jesus Christ of Latter-day Saints can seem like an unending journey in the wilderness. Do we exclaim “It is a hard thing.” or “How is it possible?” and give up? Or do we rejoice in the journey knowing that with God we can bear all trials?", room: "430", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop3 = Workshop(name: "Workshop 1", title: "Life After Coming Out", time: sessionOneTime, description: "With combined self-love and compassion we will navigate the different obstacles in life after coming out in a safe and open environment. We all have something unique to learn from each other by sharing our stories", room: "421", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop4 = Workshop(name: "Workshop 1", title: "Legal Protections: Know Your Rights", time: sessionOneTime, description: "Asaf Orr is a Senior Staff Attorney on the Transgender Youth Project for the National Center for Lesbian Rights. He has worked to help people, specifically trans youth, know and understand what their rights are when it comes to legal issues.", room: "422", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop5 = Workshop(name: "Workshop 1", title: "The Power of Storytelling", time: sessionOneTime, description: "As a parent of an LGBTQ+ child in most cases it can be hard for you to feel like you can help them unless you are LGBTQ+ yourself. Because you are not a part of the same demographic and can be hard for you to relate, share personal stories and even help them understand who they are. As a parent of an LGBTQ+ child it can also be difficult for you to understand how to help them because acceptance begins at the root of a queer child’s life and perspective on their future. Many of them have parents who do not accept them or who do not understand them. In this workshop we will discuss the power of storytelling and how it is important to help your child relate to their peers but also how it is important to share your stories to help educate yourselves, your child and other parents.", room: "418", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop6 =  Workshop(name: "Workshop 1", title: "My Story: A panel moderated by Wendy VonSosen, President of Mama Dragons, featuring Emma Gee", time: sessionOneTime, description: "Hear more about Emma Gee's story and what it's like to be the first out athlete at BYU Provo.", room: "322", map: (UIImage(named: "Podium-3")?.pngData())!)
            let workshop7 = Workshop(name: "Workshop 1", title: "I am Transgender: A Conversation with Jen Richards", time: sessionOneTime, description: "Come have a conversation with Jen Richards, a successful activist, writer, actress and producer. Jen will talk openly and honestly about her journey as a transgender woman.", room: "333", map: (UIImage(named: "Podium-3")?.pngData())!)
            let workshop8 = Workshop(name: "Workshop 1", title: "Gender Identity", time: sessionOneTime, description: "A presentation regarding gender identity, transitioning, legal issues, and how we can help.", room: "234", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop9 = Workshop(name: "Workshop 1", title: "What your LGBTQ+ friends and family want you to know about coming out", time: sessionOneTime, description: "Come have a discussion with Matt Easton, the BYU Validictorian who came out in his graduation speech", room: "240", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop10 = Workshop(name: "Workshop 1", title: "Guardians of Safe Spaces", time: sessionOneTime, description: "", room: "231", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop11 = Workshop(name: "Workshop 1", title: "Dealing with Coming Out", time: sessionOneTime, description: "Come here more of Ed Smart's story", room: "131", map: (UIImage(named: "Podium-1")?.pngData())!)
            return[workshop1,workshop2,workshop3,workshop4,workshop5,workshop6,workshop7,workshop8,workshop9,workshop10,workshop11]
        }
        var adultWorkshop2: [Workshop] {
            let workshop1 = Workshop(name: "Workshop 2", title: "Finding the Courage to Push Through Adversity", time: sessionTwoTime, description: "It's upon you to make your own choices, get up when you fall, and have the courage to overcome adversity. Mondo comes from Mesa, AZ. He is half Navajo Indian and half black, and spent his youth on the Navajo reservation. Mondo went on Native American Indian placement program with LDS Church. Upon graduating from high school with track scholarship to BYU, he served on LDS mission to Oklahoma City. He served as an EFY counselor for 4 years, went on to graduate from UVSC and then University of Utah in Electronic Journalism. He is currently the Head Volleyball coach at Skyline High, and the Youth Director at Club V Volleyball. He has been with his partner for 14 years, and they have been married for 1 year. They have 24 grandchildren!", room: "429", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop2 = Workshop(name: "Workshop 2", title: "Bearing Your Journey (Without Murmuring)", time: sessionTwoTime, description: "The journey of an LGBT Saint in the Church of Jesus Christ of Latter-day Saints can seem like an unending journey in the wilderness. Do we exclaim “It is a hard thing.” or “How is it possible?” and give up? Or do we rejoice in the journey knowing that with God we can bear all trials?", room: "430", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop3 = Workshop(name: "Workshop 2", title: "Life After Coming Out", time: sessionTwoTime, description: "With combined self-love and compassion we will navigate the different obstacles in life after coming out in a safe and open environment. We all have something unique to learn from each other by sharing our stories", room: "421", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop4 = Workshop(name: "Workshop 2", title: "Legal Protections: Know Your Rights", time: sessionTwoTime, description: "Asaf Orr is a Senior Staff Attorney on the Transgender Youth Project for the National Center for Lesbian Rights. He has worked to help people, specifically trans youth, know and understand what their rights are when it comes to legal issues.", room: "422", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop5 = Workshop(name: "Workshop 2", title: "Distress Management", time: sessionTwoTime, description: "I can't remember if there was ever a time I wasn't stressed. What do I do about this? How can I deal with stress? This workshop focuses on how to healthily handle distressing emotions and experiences.", room: "418", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop6 = Workshop(name: "Workshop 2", title: "A Friendship Circle led by Charlie Bird", time: sessionTwoTime, description: "FIND SUPPORT, VALIDATION, AND LEARN FROM EACH OTHER’S EXPERIENCES ", room: "234", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop7 = Workshop(name: "Workshop 2", title: "QPR Training", time: sessionTwoTime, description: "The QPR mission is to reduce suicidal behaviors and save lives by providing innovative, practical and proven suicide prevention training. The signs of crisis are all around us. We believe that quality education empowers all people, regardless of their background, to make a positive difference in the life of someone they know.", room: "240", map: (UIImage(named: "Podium-2")?.pngData())!)
               let workshop8 = Workshop(name: "Workshop 2", title: "Guardians of Safe Spaces", time: sessionTwoTime, description: "", room: "231", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop9 = Workshop(name: "Workshop 2", title: "Gay Rights and the Mormon Church: Ask the Author", time: sessionTwoTime, description: "Greg Prince will engage the audience in an hour-long discussion of his recent book.", room: "131", map: (UIImage(named: "Podium-1")?.pngData())!)
            return[workshop1,workshop2,workshop3,workshop4,workshop5,workshop6,workshop7,workshop8,workshop9]
        }
        var adultWorkshop3: [Workshop] {
            let workshop1 = Workshop(name: "Workshop 3", title: "Finding the Courage to Push Through Adversity", time: sessionThreeTime, description: "It's upon you to make your own choices, get up when you fall, and have the courage to overcome adversity. Mondo comes from Mesa, AZ. He is half Navajo Indian and half black, and spent his youth on the Navajo reservation. Mondo went on Native American Indian placement program with LDS Church. Upon graduating from high school with track scholarship to BYU, he served on LDS mission to Oklahoma City. He served as an EFY counselor for 4 years, went on to graduate from UVSC and then University of Utah in Electronic Journalism. He is currently the Head Volleyball coach at Skyline High, and the Youth Director at Club V Volleyball. He has been with his partner for 14 years, and they have been married for 1 year. They have 24 grandchildren!", room: "429", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop2 = Workshop(name: "Workshop 3", title: "Bearing Your Journey (Without Murmuring)", time: sessionThreeTime, description: "The journey of an LGBT Saint in the Church of Jesus Christ of Latter-day Saints can seem like an unending journey in the wilderness. Do we exclaim “It is a hard thing.” or “How is it possible?” and give up? Or do we rejoice in the journey knowing that with God we can bear all trials?", room: "430", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop3 = Workshop(name: "Workshop 3", title: "Two is better than one: Growing up with gay parents", time: sessionThreeTime, description: "Devin Preston, daughter of lesbian mothers, is ready to share all when it comes to being raised in a non-traditional household in a heteronormative world. She hopes her unique perspective will give insight into the world of parenting for LGBTQ+ couples and what their children experience.", room: "421", map: (UIImage(named: "Podium-4")?.pngData())!)
              let workshop4 = Workshop(name: "Workshop 3", title: "Legal Protections: Know Your Rights", time: sessionThreeTime, description: "Asaf Orr is a Senior Staff Attorney on the Transgender Youth Project for the National Center for Lesbian Rights. He has worked to help people, specifically trans youth, know and understand what their rights are when it comes to legal issues.", room: "422", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop5 = Workshop(name: "Workshop 3", title: "Happiness & Mindfulness", time: sessionThreeTime, description: "What is happiness and how do I get more of it? I've heard this 'mindfulness' word thrown around as a panacea; why do hipsters keep talking about it? This workshop focuses on how our expectations and responses to emotion play a role in our happiness.", room: "418", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop6 = Workshop(name: "Workshop 3", title: "WayOUT Panel", time: sessionThreeTime, description: "wayOUT was started by a group of friends in San Francisco to help change what it means to grow up as a sexual minority in America. Come chat with three of wayOUT's members about their own personal experiences from coming out to building their professional careers and everything in between.", room: "234", map: (UIImage(named: "Podium-4")?.pngData())!)
            let workshop7 = Workshop(name: "Workshop 3", title: "QPR Training", time: sessionThreeTime, description: "The QPR mission is to reduce suicidal behaviors and save lives by providing innovative, practical and proven suicide prevention training. The signs of crisis are all around us. We believe that quality education empowers all people, regardless of their background, to make a positive difference in the life of someone they know.", room: "240", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop8 = Workshop(name: "Workshop 3", title: "Guardians of Safe Spaces", time: sessionThreeTime, description: "", room: "231", map: (UIImage(named: "Podium-2")?.pngData())!)
            let workshop9 = Workshop(name: "Workshop 3", title: "Building Healthy Futurees of LGBTQ+ Children & Youth: Learning from the Family Acceptance Project", time: sessionThreeTime, description: "A workshop for parents, caregivers and family members on affirming LGBTQ children and youth, and what we’ve learned from the first 20 years of research and family support work to decrease family rejection and prevent risk and increase family acceptance and support to promote health & well-being and strengthen families.", room: "131", map: (UIImage(named: "Podium-1")?.pngData())!)
            return[workshop1,workshop2,workshop3,workshop4,workshop5,workshop6,workshop7,workshop8,workshop9]
        }
        return[adultWorkshop1, adultWorkshop2, adultWorkshop3]
    }
    
    
    
    //PARENT WORKSHOPS
    var parentWorkshops: [[Workshop]] {
        var parentWorkshop1: [Workshop] {
            return[]
        }
        var parentWorkshop2: [Workshop] {
            return[]
        }
        var parentWorkshop3: [Workshop] {
            return[]
        }
        return[parentWorkshop1, parentWorkshop2, parentWorkshop3]
    }
    
    
    
    //EDUCATOR WORKSHOPS
    var educatorWorkshops: [[Workshop]] {
         var educatorWorkshop1: [Workshop] {
            return[]
        }
         var educatorWorkshop2: [Workshop] {
            return[]
        }
         var educatorWorkshop3: [Workshop] {
            return[]
        }
        return[educatorWorkshop1, educatorWorkshop2, educatorWorkshop3]
    }
}
