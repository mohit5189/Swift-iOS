
// https://medium.com/@shalini.padu/pause-resume-cancel-downloads-in-nsurlsession-a05470682c3b

// We can resume using NSURLSession

// Pause and resume when app running

/*
 When the download fails due to temporary loss of connectivity, or when the wifi is out of range, the sesssion will call the
 
 ===================
 
 URLSession:task:didCompleteWithError
 
 ====================
 
 delegate method. If the error is not nil, look for the NSURLSessionDownloadTaskResumeData in the userInfodictionary. If this key exists, we should store this for using it later to resume the download, if the key does not exits, it means this download cannot be resumed from where it left, and we need to start over the download

 let downloadTask = urlSession.downloadTask(withResumeData: resumeData)
 downloadTask.resume()

 
 downloadTask.cancel { resumeDataOrNil in
     guard let resumeData = resumeDataOrNil else {
       // download can't be resumed; remove from UI if necessary
       return
     }
     self.resumeData = resumeData
 }

 */


/*
 Resuming after kill
 https://developer.apple.com/documentation/foundation/url_loading_system/downloading_files_in_the_background
 
 1. Create session with unique ID
 let config = URLSessionConfiguration.background(withIdentifier: "MySession")

 
 */


