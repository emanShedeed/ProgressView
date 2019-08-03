//
//  ViewController.swift
//  ProgressView
//
//  Created by gody on 8/3/19.
//  Copyright © 2019 gody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 let shapeLayer=CAShapeLayer()
    var progressInfoLbl:UILabel={
        let label=UILabel()
        label.text="Budget"
        label.textAlignment = .center
        label.font=UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressInfoLbl.frame=CGRect(x: 0, y: 0, width: 100, height: 100)
        progressInfoLbl.center=view.center
        view.addSubview(progressInfoLbl)
        let center = view.center
        ///create my track Layer
        let circularPath=UIBezierPath(arcCenter: center, radius: 100, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        let trackLayer=CAShapeLayer()
        trackLayer.path=circularPath.cgPath
        trackLayer.strokeColor=UIColor.lightGray.cgColor
        trackLayer.lineWidth=10
        trackLayer.fillColor=UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        //trackLayer.lineCap=CAShapeLayerLineCap.round
        ///
      //  let circularPath=UIBezierPath(arcCenter: center, radius: 100, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        shapeLayer.path=circularPath.cgPath
        shapeLayer.strokeColor=UIColor.red.cgColor
        shapeLayer.lineWidth=10
         shapeLayer.fillColor=UIColor.clear.cgColor
        shapeLayer.lineCap=CAShapeLayerLineCap.round
        shapeLayer.strokeEnd=0
       
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handelTap)))
    }
    fileprivate func animateCircle() {
        let basicAnimation=CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue=1000.0/2500.0
        basicAnimation.duration=1
        basicAnimation.fillMode=CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion=false
        shapeLayer.add(basicAnimation, forKey: "progress")
    }
    func beginDownloadingFile() {
        print("Begin Downloading File")
    }
    @objc func handelTap(){
        beginDownloadingFile()
        animateCircle()
    }

}

