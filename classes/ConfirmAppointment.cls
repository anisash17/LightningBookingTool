@isTest
global class ConfirmAppointment implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {

        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

        String subToCompare = 'Your meeting has been scheduled';
        System.debug('SUBJECT: '+email.subject); 
        try{
            if(email.subject.containsIgnoreCase(subToCompare))
            {
                String message = email.plainTextBody;
                String meetingID;
                if(message.containsIgnoreCase('YES')){
                  System.debug('Confirmed!');  
                  Pattern MyPattern = Pattern.compile('M-[0-9][0-9][0-9][0-9][0-9][0-9]');
                  matcher myMatcher = myPattern.matcher(email.subject);
                  if(myMatcher.find()){
                      meetingID= myMatcher.group(0);
                      System.debug('meetingID '+meetingID);
                  }
                }
                List<Meeting__c> lstMeetingToUpdate;
                if(meetingID!= null && meetingID != ''){
                    lstMeetingToUpdate = [Select Id, isConfirmed__C from Meeting__c where Name=:meetingID ];
                    System.debug('lstMeetingToUpdate'+lstMeetingToUpdate);
                }
                if(lstMeetingToUpdate!= null && !lstMeetingToUpdate.isEmpty()){
                    lstMeetingToUpdate[0].isConfirmed__C = true;
                    update lstMeetingToUpdate[0];
                }
    
            }
        }
        catch(Exception e){
            System.debug('ERROR');
            result.success = FALSE;
            return result;
        }
        result.success = TRUE;
        return result;
    }

}