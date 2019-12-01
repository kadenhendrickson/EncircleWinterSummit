//
//  FloorDetailViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/17/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class FloorDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var floor: Floor?
    var isZooming = false
    var originalImageCenter:CGPoint?
    
    @IBOutlet weak var floorMapImage: UIImageView!
    @IBOutlet weak var buildingNameTextLabel: UILabel!
    @IBOutlet weak var floorNumberTextLabel: UILabel!
    @IBOutlet weak var roomsTextLabel: UILabel!
    @IBOutlet weak var encircleHouseImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        floorMapImage.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture(sender:)))
        pinchGesture.delegate = self
        floorMapImage.addGestureRecognizer(pinchGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(sender:)))
        panGesture.delegate = self
        floorMapImage.addGestureRecognizer(panGesture)
    }
    
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        if sender.state == .began {
        let currentScale = self.floorMapImage.frame.size.width / self.floorMapImage.bounds.size.width
        let newScale = currentScale*sender.scale
        if newScale > 1 {
        self.isZooming = true
        }
        } else if sender.state == .changed {
        guard let view = sender.view else {return}
        let pinchCenter = CGPoint(x: sender.location(in: view).x - view.bounds.midX,
        y: sender.location(in: view).y - view.bounds.midY)
        let transform = view.transform.translatedBy(x: pinchCenter.x, y: pinchCenter.y)
        .scaledBy(x: sender.scale, y: sender.scale)
        .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
        let currentScale = self.floorMapImage.frame.size.width / self.floorMapImage.bounds.size.width
        var newScale = currentScale*sender.scale
        if newScale < 1 {
        newScale = 1
        let transform = CGAffineTransform(scaleX: newScale, y: newScale)
        self.floorMapImage.transform = transform
        sender.scale = 1
        }else {
        view.transform = transform
        sender.scale = 1
        }
        } else if sender.state == .ended || sender.state == .failed || sender.state == .cancelled {
        guard let center = self.originalImageCenter else {return}
        UIView.animate(withDuration: 0.3, animations: {
        self.floorMapImage.transform = CGAffineTransform.identity
        self.floorMapImage.center = center
        }, completion: { _ in
        self.isZooming = false
        })
        }

    }
    
    @objc func pan(sender: UIPanGestureRecognizer) {
 if self.isZooming && sender.state == .began {
    self.originalImageCenter = sender.view?.center
    } else if self.isZooming && sender.state == .changed {
    let translation = sender.translation(in: self.view)
    if let view = sender.view {
    view.center = CGPoint(x:view.center.x + translation.x,
    y:view.center.y + translation.y)
    }
    sender.setTranslation(CGPoint.zero, in: self.floorMapImage.superview)
    }
    }
    
    func setUpViews(){
        self.view.backgroundColor = .black
        floorMapImage.image = floor?.map
        buildingNameTextLabel.text = buildingName()
        buildingNameTextLabel.font = UIFont(name: FontNames.playfairBold, size: 36)
        buildingNameTextLabel.textColor = .white
        floorNumberTextLabel.text = floor?.name
        floorNumberTextLabel.font = UIFont(name: FontNames.futuraBold, size: 20)
        floorNumberTextLabel.textColor = .white
        roomsTextLabel.text = floor?.rooms
        roomsTextLabel.font = UIFont(name: FontNames.futuraBook, size: 16)
        roomsTextLabel.textColor = .white
        
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
    }
    
    func buildingName() -> String {
        if(FloorController.shared.building == FloorController.shared.adobeFloors) {
            return "Adobe Building"
        } else {
            return "Podium Building"
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
