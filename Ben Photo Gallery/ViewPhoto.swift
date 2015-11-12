//
//  ViewPhoto.swift
//  Ben Photo Gallery
//
//  Created by Ben Liang on 11/12/15.
//  Copyright (c) 2015 Ben Liang. All rights reserved.
//

import UIKit

class ViewPhoto: UIViewController {
    
    //Actions and Outlets
    @IBAction func btnCancel(sender: AnyObject) {
        println("Cancel was pushed")
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func btnExport(sender: AnyObject) {
        println("Export was pushed")
    }
    
    @IBAction func btnTrash(sender: AnyObject) {
        println("Trash was pushed")
    }
    
    @IBOutlet var imgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
