//
//  Onboarding.swift
//  Onboarding
//
//  Created by Joseph Storer on 1/24/20.
//  Copyright © 2020 Joseph Storer. All rights reserved.
//

import UIKit

class Onboarding: UIView, UIScrollViewDelegate {
    
    // Our controllers
    var scrollView: UIScrollView?
    var pageControl: UIPageControl?
    var slides: [Slide]?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        createControls()

        slides = generateSlides()
        setupSlideScrollView(slides: slides!)

    }
    
    private func createControls() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        scrollView?.backgroundColor = .red
        self.addSubview(scrollView!)
        scrollView!.delegate = self
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView!.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.frame.height)
        scrollView!.contentSize = CGSize(width: self.frame.width * CGFloat(slides.count), height: self.frame.height)
        scrollView!.isPagingEnabled = true
           
           for i in 0 ..< slides.count {
               slides[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
               scrollView!.addSubview(slides[i])
           }
       }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Did scroll")
           // let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            //pageController.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            

       // scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
            
        
 
            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
                
                slides![0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
                slides![1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
                
            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
                slides![1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
                slides![2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
                
            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
                slides![2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
                slides![3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
                
            } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
                slides![3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
                slides![4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            }
        }
    
    
    // This is an example of creating slides
    
    private func generateSlides() -> [Slide]{
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(systemName: "pencil.circle")
        slide1.mainTitle.text = "Slide number 1"
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(systemName: "pencil.circle.fill")
        slide2.mainTitle.text = "Slide numero 2"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(systemName: "pencil.circle.fill")
        slide3.mainTitle.text = "Slide numero 3"
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageView.image = UIImage(systemName: "pencil.circle.fill")
        slide4.mainTitle.text = "Slide numero 4"
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imageView.image = UIImage(systemName: "pencil.circle.fill")
        slide5.mainTitle.text = "Slide numero 5"
 
    
        return [slide1,slide2,slide3,slide4,slide5]
        
    }
    
    

}
