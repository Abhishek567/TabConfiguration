//
//  ResearchKitBridge.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 11/04/23.
//

import SwiftUI
import ResearchKit

struct ConsestView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    class Coordinator: NSObject, ORKTaskViewControllerDelegate {
        let parent : ConsestView
        
        init(parent: ConsestView) {
            self.parent = parent
        }
        
        func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
            
            taskViewController.dismiss(animated: true, completion: {
                self.parent.presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        
        var ConsentTask: ORKOrderedTask {
            
            let Document = ORKConsentDocument()
            Document.title = "Test Consent"
            
            let sectionTypes: [ORKConsentSectionType] = [
                .overview,
                .dataGathering,
                .privacy,
                .dataUse,
                .timeCommitment,
                .studySurvey,
                .studyTasks,
                .withdrawing
            ]
            
            let consentSections: [ORKConsentSection] = sectionTypes.map { contentSectionType in
                let consentSection = ORKConsentSection(type: contentSectionType)
                consentSection.summary = "Complete the study"
                consentSection.content = "This survey will ask you three questions and you will also measure your tapping speed by performing a small activity."
                return consentSection
            }
            
            Document.sections = consentSections
            Document.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "UserSignature"))
            
            var steps = [ORKStep]()
            
            //Visual Consent
            let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsent", document: Document)
            steps += [visualConsentStep]
            
            //Signature
            let signature = Document.signatures!.first! as ORKConsentSignature
            let reviewConsentStep = ORKConsentReviewStep(identifier: "Review", signature: signature, in: Document)
            reviewConsentStep.text = "Review the consent"
            reviewConsentStep.reasonForConsent = "Consent to join the Research Study."
            
            steps += [reviewConsentStep]
            
            //Completion
            let completionStep = ORKCompletionStep(identifier: "CompletionStep")
            completionStep.title = "Welcome"
            completionStep.text = "Thank you for joining this study."
            steps += [completionStep]
            
           return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
        }
        
        let taskController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskController.delegate = context.coordinator
        return taskController
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
    
    
    
}
