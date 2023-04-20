//
//  ActiveTasksView.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 12/04/23.
//

import SwiftUI
import ResearchKit

struct ActiveTasksView : UIViewControllerRepresentable{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    class Coordinator: NSObject, ORKTaskViewControllerDelegate {
        let parent : ActiveTasksView
        
        init(parent: ActiveTasksView) {
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
    
    func makeUIViewController(context: Context) -> ORKTaskViewController{
        func getDocumentsDirectory() -> URL
        {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentsDirectory = paths[0]
            return documentsDirectory
        }

        func getFileUrl() -> URL
        {
            let filename = "myRecording.m4a"
            let filePath = getDocumentsDirectory().appendingPathComponent(filename)
        return filePath
        }
        
        let tasks = ORKOrderedTask.audioTask(withIdentifier: "AudioTest", intendedUseDescription: "Let evaluate your Voice", speechInstruction: "Test", shortSpeechInstruction: "Say Hello Friends", duration: 5, recordingSettings: nil , checkAudioLevel: true, options: ORKPredefinedTaskOption())
        let taskViewController = ORKTaskViewController(task: tasks, taskRun: nil)
        taskViewController.delegate = context.coordinator
        taskViewController.outputDirectory = getFileUrl()
        taskViewController.discardable = false
        return taskViewController
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
        
    }
}
