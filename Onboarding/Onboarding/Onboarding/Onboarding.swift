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
    var slides = [Slide]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        createControls()

        slides = generateSlides()
        setupSlideScrollView(slides: slides)

    }
    
    private func createControls() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(scrollView!)
        scrollView!.delegate = self
        
        pageControl = UIPageControl(frame: CGRect(x: 50, y: 50, width: self.frame.width, height: self.frame.height*0.1))
        self.addSubview(pageControl!)
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
        let pageIndex = round(scrollView.contentOffset.x/self.frame.width)
        pageControl!.currentPage = Int(pageIndex)
        }
    
    
    // This is an example of creating slides
    
    private func generateSlides() -> [Slide]{
        return [createDemoSlide(),createDemoSlide(),createDemoSlide(),createDemoSlide(),createDemoSlide(),]
    }
    
    private func createDemoSlide() -> Slide{
        let slide: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide.imageView.image = UIImage(systemName: "pencil.circle")
        slide.mainTitle.text = "Slide Header"
        slide.descriptionText.text = "Basic slide description with wrapping"
        
        return slide
    }
    
    

}
