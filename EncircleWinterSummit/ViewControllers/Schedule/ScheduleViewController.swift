//
//  ScheduleViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/6/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var currentTrackButton: UIButton!
    @IBOutlet var trackButtons: [UIButton]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sourceOfTruth: [[Workshop]]?
    var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        WorkshopController.shared.setWorkshopsForTrack()
        sourceOfTruth = WorkshopController.shared.workshopsForTrack
        currentUser = UserController.shared.currentUser
        
        self.collectionView.backgroundColor = .black
        self.view.backgroundColor = .black
        
        
        currentTrackButton.setTitle("Test", for: .normal)
        self.view.bringSubviewToFront(currentTrackButton)


        trackButtons.forEach { (button) in
            button.isHidden = true
        }
        
}
    @IBAction func currentTrackButtonClicked(_ sender: Any) {
        trackButtons.forEach { (button) in
            if(button.titleLabel?.text != currentTrackButton.titleLabel?.text){
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @IBAction func trackButtonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text, let bgColor = sender.backgroundColor else {return}
            currentTrackButton.setTitle(title, for: .normal)
            currentTrackButton.backgroundColor = bgColor
        trackButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = true
            }
        }
        setUserPreference(sender)
        setUserSchedule(sender)
        WorkshopController.shared.setWorkshopsForTrack()
        collectionView.reloadData()
    }
    
    //HELPER FUNCTIONS
    func setUserPreference(_ sender: UIButton){
           switch sender.titleLabel?.text {
           case Track.youth.rawValue:
                UserController.shared.setUserTrackPreference(track: .youth)
           case Track.adult.rawValue:
                   UserController.shared.setUserTrackPreference(track: .adult)
           case Track.youngAdult.rawValue:
                   UserController.shared.setUserTrackPreference(track: .youngAdult)
           case Track.parent.rawValue:
                   UserController.shared.setUserTrackPreference(track: .parent)
           case Track.educator.rawValue:
                   UserController.shared.setUserTrackPreference(track: .educator)
               default:
                   print("nope bitch")
               }
       }
    
    //Changes the Schedule
    func setUserSchedule(_ sender: UIButton){
        switch sender.titleLabel?.text{
        case Track.youngAdult.rawValue, Track.youth.rawValue:
            currentUser?.schedule = [WorkshopController.youthIntroAndOutroWorkshops[0], nil, nil, nil, nil, WorkshopController.youthIntroAndOutroWorkshops[1], WorkshopController.youthIntroAndOutroWorkshops[2]]
        case Track.adult.rawValue, Track.parent.rawValue, Track.educator.rawValue:
            currentUser?.schedule = [WorkshopController.adultIntroAndOutroWorkshops[0], nil, nil, nil, WorkshopController.adultIntroAndOutroWorkshops[1], WorkshopController.adultIntroAndOutroWorkshops[2]]
        default: print("this shouldn't be printing")
        }
        collectionView.reloadData()
    }
    
    //MARK: Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "toWorkshopList"){
//            if let indexPaths = collectionView.indexPathsForSelectedItems {
//                let indexPath = indexPaths[0]
//                guard let destinationVC = segue.destination as? WorkshopListCollectionViewController, let sourceOfTruth = sourceOfTruth else {return}
//                let workshops = sourceOfTruth[indexPath.row]
//                destinationVC.workshops =  workshops
//            }
//        }
//    }
}
    
 
extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(currentUser?.trackPreference == Track.youngAdult || currentUser?.trackPreference == Track.youth){
            return 8
        } else {
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let userSchedule = currentUser?.schedule else {return UICollectionViewCell()}
        switch indexPath.row {
        case 0:
            //Header Cell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as? TitleCollectionViewCell else {return UICollectionViewCell()}
            cell.backgroundColor = .white
            return cell
            //Set the first and last two cells to be intro/outro cells
        case 1, userSchedule.count, userSchedule.count - 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "introAndOutroCell", for: indexPath) as? IntroAndOutroCollectionViewCell else {return UICollectionViewCell()}
            cell.workshop = userSchedule[indexPath.row-1]
            cell.backgroundColor = .white
            return cell
            
            //Set all other cells to be workshop cells. Check to see if the workshop has been chosen yet.
        default:
            if(UserController.shared.currentUser?.schedule[indexPath.row-1] == nil){ //workshops havent been chosen
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noWorkshopCell", for: indexPath) as? NoWorkshopCollectionViewCell else {return UICollectionViewCell()}
                cell.indexPath = indexPath.row
                cell.backgroundColor = .white

                return cell
            } else { // workshops have been chosen already
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell", for: indexPath) as? ScheduleCollectionViewCell else {return UICollectionViewCell()}
                let workshop = UserController.shared.currentUser?.schedule[indexPath.row-1]
                cell.workshop = workshop
                cell.backgroundColor = .white
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let sourceOfTruth = sourceOfTruth else {return
            
        }
        if(UserController.shared.currentUser?.trackPreference == Track.youth || UserController.shared.currentUser?.trackPreference == Track.youngAdult) {
            switch indexPath.row {
            case 2,3,4,5 :
                if(UserController.shared.currentUser?.schedule[indexPath.row-1] == nil){
                    

                    let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
                    guard let controller = storyboard.instantiateViewController(withIdentifier: "workshopList") as? WorkshopListViewController else {return}
                    controller.workshops = sourceOfTruth[indexPath.row - 2]
                    self.present(controller, animated: true)
                    
                }
                //present the detail view controller
                
            default:
                print("other cells dont go anywhere, you have to click the 'session info' button")
            }
        } else {
            switch indexPath.row {
            case 2,3,4:
                if(UserController.shared.currentUser?.schedule[indexPath.row-1] == nil){
                    let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
                    guard let controller = storyboard.instantiateViewController(withIdentifier: "workshopList") as? WorkshopListViewController else {return}
                    controller.workshops = sourceOfTruth[1]
                    self.present(controller, animated: true)
                }
            default:
                print("Once there's a workshop, you're not supposed to do anything ya dumb cell")
            }
        }
    }
}

extension ScheduleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row == 0) {
            let width = collectionView.frame.width
             let height = width/1.4
             return CGSize(width: width, height: height)
         }
         let width = view.frame.width-40
         return CGSize(width: width, height: width/2.8)
     }
    }

