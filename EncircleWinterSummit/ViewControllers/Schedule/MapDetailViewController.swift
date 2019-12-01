//
//  MapDetailViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/23/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class MapDetailViewController: UIViewController, UIGestureRecognizerDelegate{
    
    var workshop: Workshop?
    var isZooming = false
    var originalImageCenter:CGPoint?
    

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var encircleHouseImage: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var workshopTitleLabel: HeaderCellTitleLabel!
    @IBOutlet weak var workshopTimeLabel: HeaderCellDescriptionLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        mapImage.isUserInteractionEnabled =  true
        
         let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture(sender:)))
                   pinchGesture.delegate = self
                   mapImage.addGestureRecognizer(pinchGesture)
                   let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(sender:)))
                   panGesture.delegate = self
                   mapImage.addGestureRecognizer(panGesture)
    }

       
       @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
           if sender.state == .began {
           let currentScale = self.mapImage.frame.size.width / self.mapImage.bounds.size.width
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
           let currentScale = self.mapImage.frame.size.width / self.mapImage.bounds.size.width
           var newScale = currentScale*sender.scale
           if newScale < 1 {
           newScale = 1
           let transform = CGAffineTransform(scaleX: newScale, y: newScale)
           self.mapImage.transform = transform
           sender.scale = 1
           }else {
           view.transform = transform
           sender.scale = 1
           }
           } else if sender.state == .ended || sender.state == .failed || sender.state == .cancelled {
           guard let center = self.originalImageCenter else {return}
           UIView.animate(withDuration: 0.3, animations: {
           self.mapImage.transform = CGAffineTransform.identity
           self.mapImage.center = center
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
       sender.setTranslation(CGPoint.zero, in: self.mapImage.superview)
       }
       }
    
    func setUpViews(){
        guard let workshop = workshop else {return}
        self.view.backgroundColor = .black
        mapImage.image = UIImage(named: workshop.map)
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        roomNameLabel.text = "Room: \(workshop.room)"
        roomNameLabel.textColor = .white
        workshopTitleLabel.text = workshop.title
        workshopTimeLabel.text = workshop.time.toString()
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
