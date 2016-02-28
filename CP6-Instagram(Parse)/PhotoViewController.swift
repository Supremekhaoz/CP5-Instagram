//
//  PhotoViewController.swift
//  CP6-Instagram(Parse)
//
//  Created by Luis Liz on 2/27/16.
//  Copyright © 2016 Luis Liz. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    var uploadedPhoto = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = uploadedPhoto
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makePost(sender: AnyObject) {
        print("post")
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelPost(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
