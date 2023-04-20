//
//  SurveyFormView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 11/04/23.
//

import SwiftUI
import ResearchKit
import UIKit
import CoreData

struct surveyFormView : UIViewControllerRepresentable{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var surveys: FetchedResults<Survey>
    
    class Coordinator: NSObject, ORKTaskViewControllerDelegate {
        let parent : surveyFormView
        
        init(parent: surveyFormView) {
            self.parent = parent
        }
        
        
        func taskViewControllerSupportsSaveAndRestore(_ taskViewController: ORKTaskViewController) -> Bool {
            return true
        }
        
        func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
         
            switch reason{
            case .completed:
                break
            case .discarded, .failed:
              
                let data = taskViewController.restorationData
                
                break
            case .saved:
                let data = taskViewController.restorationData
                let survey = Survey(context: parent.viewContext)
                survey.id = "1111"
                survey.progress = data
                try? parent.viewContext.save()
                break
            default:
                break
            }
            
            taskViewController.dismiss(animated: true, completion: {
                self.parent.presentationMode.wrappedValue.dismiss()
            })
            
            
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController{
        func getDocumentsDirectory() -> URL
        {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentsDirectory = paths[0]
            return documentsDirectory
        }
        
        let instructions = ORKInstructionStep(identifier: "surveyInsteuctions")
        instructions.title = "We'll ask you a few questions"
        instructions.text = "Here are the instructions on how to answer them"
//
        let heightQuestion = ORKQuestionStep(identifier: "heightQuestionStep",
                                             title: "Your Height",
                                             question: "How tall are  you",
                                             answer: ORKHeightAnswerFormat(measurementSystem: .metric))
        
        let happyQuestion = ORKQuestionStep(identifier: "happyQuestionStep",
                                            title: "Stay Positive",
                                            question: "Are you happy about that?",
                                            answer: ORKTextChoiceAnswerFormat(style: .singleChoice,
                                                textChoices: [
                                                ORKTextChoice(text: "Yes", value: NSNumber(integerLiteral: 0)),
                                                ORKTextChoice(text: "Not really", value: NSNumber(integerLiteral: 1))]))
        
        let MultiChoice = ORKQuestionStep(identifier: "MultiChoice",
                                            title: "Multi Choice",
                                            question: "Select your Fovourite Games",
                                            answer: ORKTextChoiceAnswerFormat(style: .multipleChoice,
                                                textChoices: [
                                                ORKTextChoice(text: "BasketBall" ,value: NSNumber(integerLiteral: 0)),
                                                ORKTextChoice(text: "Bowling" ,value: NSNumber(integerLiteral: 1)),
                                                ORKTextChoice(text: "Cricket", value: NSNumber(integerLiteral: 3))
                                                ]))
        
        let DateStep = ORKQuestionStep(identifier: "Date",
                                              title: "BirthDate",
                                              question: "Enter your Birthdate",
                                              answer: ORKDateAnswerFormat(style: .date))
        
        
        let ScaleStep = ORKQuestionStep(identifier: "Scale",
                                              title: "Scale",
                                              question: "Test the Scale",
                                              answer: ORKScaleAnswerFormat(maximumValue: 300, minimumValue: 50, defaultValue: 75, step: 25))
        
        let WeightStep = ORKQuestionStep(identifier: "Weight",
                                              title: "Weight",
                                              question: "Test the Weight",
                                         answer: ORKWeightAnswerFormat(measurementSystem: .local))
        
        let ImageStep = ORKQuestionStep(identifier: "Image",
                                              title: "ImageSelection",
                                              question: "Choice the Image",
                                         answer: ORKImageChoiceAnswerFormat(imageChoices: [ORKImageChoice.init(normalImage: UIImage(systemName: "trash.circle")!, selectedImage: UIImage(systemName: "trash.circle.fill")!, text: "Delete", value: NSNumber(integerLiteral: 1)),
                                                                                           
                                               ORKImageChoice.init(normalImage: UIImage(systemName: "square.and.arrow.down")!, selectedImage: UIImage(systemName: "square.and.arrow.down.fill"), text: "Save", value: NSNumber(integerLiteral: 1))
                                              ]))
        let LocationStep = ORKQuestionStep(identifier: "Location",                                                                    title: "Enter Loaction",
                                              question: "Explain why in a few words...",
                                           answer: ORKLocationAnswerFormat())
        
        let videoStep = ORKVideoCaptureStep(identifier: "videoStep")
        videoStep.title = "cpature video"
        videoStep.detailText = "detail text"
        
        let takeImageStep = ORKImageCaptureStep(identifier: "GetImage")
        takeImageStep.title = "image test"
        takeImageStep.detailText = "image capture testing"
        
//        let audioStep = ORKAudioStep(identifier: "audioStep")
//        audioStep.title = "audio test"
//        audioStep.detailText = "please record audio"
//        audioStep.stepDuration = 10
        
        
        let explanationStep = ORKQuestionStep(identifier: "explanationStep",                                              title: "Why?",
                                              question: "Explain why in a few words...",
                                              answer: ORKTextAnswerFormat(maximumLength: 288))
        
        let completion = ORKCompletionStep(identifier: "completionStep")
        completion.detailText = "Thank you for taking survey"
        
        let tasks = ORKOrderedTask.init(identifier: "surveyTaskID",
                                        steps: [
                                            instructions,
                                            heightQuestion,
                                            happyQuestion,
                                            MultiChoice,
                                            DateStep,
                                            ScaleStep,
                                            ImageStep,
                                            WeightStep,
                                            LocationStep,
//                                            audioStep,
                                            videoStep,
                                            takeImageStep,
                                            explanationStep,
                                            completion])
        
        let taskController = ORKTaskViewController(task: tasks, restorationData: surveys.last?.progress ?? Data(), delegate: context.coordinator, error: nil)
//         taskController.delegate = context.coordinator
        taskController.outputDirectory = getDocumentsDirectory()
        return taskController
            
        
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
        
    }
    
    
}
