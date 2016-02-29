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
    
    func resizeImg(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func makePost(sender: AnyObject) {
        let image = resizeImg(photoView.image!, newSize: CGSizeMake(200,200))
        UserMedia.postUserImage(image, withCaption: captionField.text, withCompletion: nil)
        print("posted pic")
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
