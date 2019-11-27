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
    @IBOutlet weak var sortArrowImage: UIImageView!
    
    var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up Collection View
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.backgroundColor = .black
        self.view.backgroundColor = .black
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        
        //Set up properties
        currentUser = UserController.shared.currentUser
        
        //Set up track preference drop dwon
        currentTrackButton.setTitle(currentUser?.trackPreference.rawValue, for: .normal)
        currentTrackButton.contentHorizontalAlignment = .left
        currentTrackButton.backgroundColor = setColorScheme()
        tabBarController?.tabBar.barTintColor = setColorScheme()
        sortArrowImage.image = UIImage(named: "sortDownArrow")
        
        self.view.bringSubviewToFront(currentTrackButton)
        trackButtons.forEach { (button) in
            button.isHidden = true
            button.contentHorizontalAlignment = .left
        }
}
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(true)
             tabBarController?.tabBar.barTintColor = setColorScheme()
         }
       
    
    @IBAction func currentTrackButtonClicked(_ sender: Any) {
        trackButtons.forEach { (button) in
            if(button.titleLabel?.text != currentTrackButton.titleLabel?.text){
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = !button.isHidden
                    if(button.isHidden){
                      self.sortArrowImage.image = UIImage(named: "sortDownArrow")
                    } else {
                    self.sortArrowImage.image = UIImage(named: "sortUpArrow")
                    }
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
        self.sortArrowImage.image = UIImage(named: "sortDownArrow")
        resetUserInfo(sender)
        tabBarController?.tabBar.barTintColor = setColorScheme()
        collectionView.reloadData()
    }
    
    //HELPER FUNCTIONS
    func resetUserInfo(_ sender: UIButton){
           switch sender.titleLabel?.text {
           case Track.youth.rawValue:
                UserController.shared.setUserTrackPreference(track: .youth)
                UserController.shared.resetUserSchedule(track: .youth)
           case Track.adult.rawValue:
                   UserController.shared.setUserTrackPreference(track: .adult)
                   UserController.shared.resetUserSchedule(track: .adult)
           case Track.youngAdult.rawValue:
                   UserController.shared.setUserTrackPreference(track: .youngAdult)
                   UserController.shared.resetUserSchedule(track: .youngAdult)
           case Track.parent.rawValue:
                   UserController.shared.setUserTrackPreference(track: .parent)
                   UserController.shared.resetUserSchedule(track: .parent)
           case Track.educator.rawValue:
                   UserController.shared.setUserTrackPreference(track: .educator)
                   UserController.shared.resetUserSchedule(track: .educator)
               default:
                   print("nope bitch")
               }
       }
    
    func setColorScheme() -> UIColor{
        switch UserController.shared.currentUser?.trackPreference{
        case .youth:
            return .prideBlue
        case .youngAdult:
            return .prideRed
        case .adult:
            return .pridePink
        case .parent:
            return .pridePurple
        case .educator:
            return .prideGreen
        default:
            return .clear
        }
    }
    
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
            cell.delegate = self
            cell.backgroundColor = .white
            return cell
            //Set all other cells to be workshop cells. Check to see if the workshop has been chosen yet.
        default:
            if(UserController.shared.currentUser?.schedule[indexPath.row-1] == nil){ //workshops havent been chosen
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noWorkshopCell", for: indexPath) as? NoWorkshopCollectionViewCell else {return UICollectionViewCell()}
                cell.indexPath = indexPath.row
                cell.workshopNumberLabel.backgroundColor = setColorScheme()
                cell.backgroundColor = .white
                return cell
            } else { // workshops have been chosen already
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell", for: indexPath) as? ScheduleCollectionViewCell else {return UICollectionViewCell()}
                let workshop = UserController.shared.currentUser?.schedule[indexPath.row-1]
                cell.workshop = workshop
                cell.delegate = self
                cell.nameLabelBackgroundColor.backgroundColor = setColorScheme()
                cell.backgroundColor = .white
                if((currentUser?.trackPreference == .youth || currentUser?.trackPreference == .youngAdult) && indexPath.row == 2){
                    cell.removeWorkshopButton.isHidden = true
                } else {
                    cell.removeWorkshopButton.isHidden = false
                }
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(UserController.shared.currentUser?.trackPreference == Track.youth || UserController.shared.currentUser?.trackPreference == Track.youngAdult) {
            switch indexPath.row {
            case 3,4,5 :
                if(UserController.shared.currentUser?.schedule[indexPath.row-1] == nil){
                    let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
                    guard let controller = storyboard.instantiateViewController(withIdentifier: "workshopList") as? WorkshopListViewController else {return}
                    controller.delegate = self
                    if(UserController.shared.currentUser?.trackPreference == .youth){
                        controller.workshops = WorkshopController.shared.youthWorkshops[indexPath.row - 3]
                    } else{
                        controller.workshops = WorkshopController.shared.youngAdultWokshops[indexPath.row - 3]
                    }
                    self.present(controller, animated: true)
                }
            default:
                print("other cells dont go anywhere, you have to click the 'session info' button")
            }
        } else {
            switch indexPath.row {
            case 2,3,4:
                if(UserController.shared.currentUser?.schedule[indexPath.row-1] == nil){
                    let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
                    guard let controller = storyboard.instantiateViewController(withIdentifier: "workshopList") as? WorkshopListViewController else {return}
                    controller.delegate = self
                    if(UserController.shared.currentUser?.trackPreference == .adult) {
                        controller.workshops = WorkshopController.shared.adultWorkhops[indexPath.row-2]
                    } else if(UserController.shared.currentUser?.trackPreference == .parent){
                        controller.workshops = WorkshopController.shared.parentWorkshops[indexPath.row-2]
                    } else {
                        controller.workshops = WorkshopController.shared.educatorWorkshops[indexPath.row-2]
                    }
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
            let width = collectionView.bounds.width
            let height = width/2.4
             return CGSize(width: width, height: height)
        } else if(currentUser?.schedule[indexPath.row-1] == nil){
            let width = collectionView.bounds.width - 40
            return CGSize(width: width, height: width/4)
        }
        let width = collectionView.bounds.width - 40
        return CGSize(width: width, height: width/1.5)
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
        
    }
    }

extension ScheduleViewController: IntroAndOutroCollectionViewCellDelegate {
    func sessionInfoButtonTapped(workshop: Workshop) {
        print("I recieved my instructions")
        let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "workshopDetailVC") as? WorkshopDetailViewController else {return}
        viewController.workshop = workshop
        self.present(viewController, animated: true)
    }
    
    func mapButtonTapped(workshop: Workshop) {
        let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "mapDetailVC") as? MapDetailViewController else {return}
        viewController.workshop = workshop
        self.present(viewController, animated: true)
    }
}
extension ScheduleViewController: WorkshopListViewControllerDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension ScheduleViewController: ScheduleCollectionViewCellDelegate {
    func removeWorkshopButtonTapped(workshop: Workshop) {
        UserController.shared.removeWorkshopFromUserList(workshop: workshop)
        collectionView.reloadData()
    }
    
    func scheduleSessionInfoButtonTapped(workshop: Workshop) {
        let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
         guard let viewController = storyboard.instantiateViewController(withIdentifier: "workshopDetailVC") as? WorkshopDetailViewController else {return}
         viewController.workshop = workshop
         self.present(viewController, animated: true)
    }
    
    func scheduleMapButtonTapped(workshop: Workshop) {
        let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "mapDetailVC") as? MapDetailViewController else {return}
        viewController.workshop = workshop
        self.present(viewController, animated: true)
    }
}


