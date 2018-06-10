//
//  ViewController.swift
//  CMPreviews
//
//  Created by TakahashiNobuhiro on 2018/06/09.
//  Copyright © 2018 feb19. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UITableViewController {
    
    @IBOutlet weak var gyroXLabel: UILabel!
    @IBOutlet weak var gyroYLabel: UILabel!
    @IBOutlet weak var gyroZLabel: UILabel!
    @IBOutlet weak var accelXLabel: UILabel!
    @IBOutlet weak var accelYLabel: UILabel!
    @IBOutlet weak var accelZLabel: UILabel!
    @IBOutlet weak var gravityXLabel: UILabel!
    @IBOutlet weak var gravityYLabel: UILabel!
    @IBOutlet weak var gravityZLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
    @IBOutlet weak var yawLabel: UILabel!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        motionManager.deviceMotionUpdateInterval = 0.1
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (motionData: CMDeviceMotion?, error: Error?) in
            self.update(motionData: motionData, error: error as NSError?)
        }
    }
    
    func update(motionData: CMDeviceMotion?, error: NSError?) {
        if let motion = motionData {
            gyroXLabel.text = String(round(motion.rotationRate.x * 100)/100)
            gyroYLabel.text = String(round(motion.rotationRate.y * 100)/100)
            gyroZLabel.text = String(round(motion.rotationRate.z * 100)/100)
            accelXLabel.text = String(round(motion.userAcceleration.x * 1000)/1000)
            accelYLabel.text = String(round(motion.userAcceleration.y * 1000)/1000)
            accelZLabel.text = String(round(motion.userAcceleration.z * 1000)/1000)
            gravityXLabel.text = String(round(motion.gravity.x * 100)/100)
            gravityYLabel.text = String(round(motion.gravity.y * 100)/100)
            gravityZLabel.text = String(round(motion.gravity.z * 100)/100)
            pitchLabel.text = String(round(motion.attitude.pitch * 100)/100)
            rollLabel.text = String(round(motion.attitude.roll * 100)/100)
            yawLabel.text = String(round(motion.attitude.yaw * 100)/100)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

