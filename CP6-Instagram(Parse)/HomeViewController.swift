//
//  HomeViewController.swift
//  CP6-Instagram(Parse)
//
//  Created by Luis Liz on 2/25/16.
//  Copyright © 2016 Luis Liz. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var Umedia: [UserMedia]?
    
    var data = [PFObject]?()
    
    let imagePicker = UIImagePickerController()
    var image: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getPics() { (images, error) -> () in
            self.data = images
            self.tableView.reloadData()
        }
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Buttons
    @IBAction func imageButton(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        //imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOutInBackground()
        dismissViewControllerAnimated(false, completion: nil)
        print("user logged out")
        
    }
    //My Functions
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.image = originalImage
        
        dismissViewControllerAnimated(false, completion: nil)
        performSegueWithIdentifier("editImage", sender: self)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getPics(completion: (media: [PFObject]?, error: NSError?)-> Void) {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                completion(media: media, error: nil)
            } else {
                print("couldn't retrieve media")
            }
        }
    }
    
    //Table Views
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! photoCell

        
        let image = self.data?[indexPath.row]
        
        
        if image != nil {
            cell.captionLabel.text = image!["caption"] as? String
        
            image!["media"].getDataInBackgroundWithBlock { (imageData: NSData?, error:NSError?) -> Void in
                if error == nil {
                    let image = UIImage(data: imageData!)
                    cell.photoView.image = image
                }
                }
        }
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editImage" {
            let vc = segue.destinationViewController as! PhotoViewController
            vc.uploadedPhoto = self.image
        }
    }
}