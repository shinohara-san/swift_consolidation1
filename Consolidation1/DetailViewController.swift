//
//  DetailViewController.swift
//  Consolidation1
//
//  Created by Yuki Shinohara on 2020/05/27.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
//                    imageView.layer.masksToBounds = true
//                    imageView.layer.borderWidth = 1.5
//                    imageView.layer.borderColor = UIColor.gray.cgColor

                    imageView.backgroundColor = UIColor.lightGray

        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    @objc func shareTapped(){
         guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
               print("No image found")
               return
           }

           let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
           vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
           present(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
