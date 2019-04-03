//
//  ViewController.swift
//  JournalCoreData
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var postController: PostController?
    var entries: Entry? {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    private func updateViews() {
        guard isViewLoaded else {return}
        
        //Here i would like to display the post.description on the textView but how can i get it?
        
        guard let entry = entries,
            let post = entry.post?.firstObject as? Post else {
                return
        }
        
        descriptionTextView.text = post.postDescription
        
    }
    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let description = descriptionTextView.text, !description.isEmpty, let entry = entries else {return}
        
        postController?.create(postWith: description, entry: entry)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
