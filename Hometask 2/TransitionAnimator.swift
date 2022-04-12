//
//  TransitionAnimator.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 07.12.2021.
//
// Source:
//  TransitionAnimator.swift
//  CustomTransitionDemo
//
//  Created by Artur Rymarz on 01.08.2018.
//  Copyright © 2018 OpenSource. All rights reserved.
//
import UIKit

final class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    // 1
    let presenting: Bool

    // 2
    init(presenting: Bool) {
        self.presenting = presenting
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        // 3
        //We have to elongate the animation to be most visible
        //so we set return to 2.0 i/o "hideShowBarDuration"
        return 2.0
    //        TimeInterval(UINavigationController.hideShowBarDuration)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 4
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }

        // 5
        let duration = transitionDuration(using: transitionContext)

        // 6
        let container = transitionContext.containerView
        if presenting {
            container.addSubview(toView)
        } else {
            container.insertSubview(toView, belowSubview: fromView)
        }

        // 7
        let toViewFrame = toView.frame
        toView.frame = CGRect(x: presenting ? toView.frame.width : -toView.frame.width, y: toView.frame.origin.y, width: toView.frame.width, height: toView.frame.height)
        
        //This used to be Artur Rymarz animaton sequence (fade)
        let animations = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                toView.alpha = 1
                if self.presenting {
                    fromView.alpha = 0
                }
            }

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                toView.frame = toViewFrame
                fromView.frame = CGRect(x: self.presenting ? -fromView.frame.width : fromView.frame.width, y: fromView.frame.origin.y, width: fromView.frame.width, height: fromView.frame.height)
                if !self.presenting {
                    fromView.alpha = 0
                }
            }

        }
        
        
        //Below is my GeekBrains Hometask animations (rotation)
//        let animations = {
//            //Frame 1: fromView decrease, move back
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.75, animations: {
//                let translation = CGAffineTransform(translationX: -200, y: 0)
//                let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
//                fromView.transform = translation.concatenating(scale)
//            })
//            //Frame 2: fromView fly away, toView increase & drag in
//            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4, animations: {
//                let translation = CGAffineTransform(translationX: fromView.frame.width / 2, y: 0)
//                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                toView.transform = translation.concatenating(scale)
//            })
//            //Frame 3: toView in place
//            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
//                toView.frame = toViewFrame
//                toView.transform = .identity
//            })
//
//        }

        UIView.animateKeyframes(withDuration: duration,
                                delay: 0,
                                options: .calculationModeCubic,
                                animations: animations,
                                completion: { finished in
                                    ////This used to be Artur Rymarz' finish
 //                                 container.addSubview(toView)
//                                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                                    
                                    //Below is my geekBrains hometask finish
                                    if finished && !transitionContext.transitionWasCancelled { fromView.transform = .identity}
                                    transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        })
    }
}
