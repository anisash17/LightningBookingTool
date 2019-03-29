trigger MeetingTrigger on Meeting__c (before insert) {

    List<Meeting__c> lstMeetings = Trigger.new;
    
    //Get all existing meetings for the user
    List<Meeting__c> lstExistingMeetings = [Select Id, Start_Time__c, End_Time__c from Meeting__c where Meeting_Requestor__c=:userInfo.getUserId()];
     
    if(lstExistingMeetings != null && !lstExistingMeetings.isEmpty()){
        for(Meeting__c meeting: lstMeetings){
            for(Meeting__c existingMeeting: lstExistingMeetings){
            //Check if time slot of newly created meetings overlap with existing meetings
                if(meeting.Start_Time__c == existingMeeting.Start_Time__c ||
                   meeting.End_Time__c == existingMeeting.End_Time__c ||
                   ((existingMeeting.Start_Time__c < meeting.Start_Time__c) && (meeting.Start_Time__c < existingMeeting.End_Time__c))||
                   (existingMeeting.Start_Time__c < meeting.End_Time__c) && (meeting.End_Time__c < existingMeeting.End_Time__c)){
                    
                    //In case of conflict, prompt error to user
                    meeting.addError('You have a conflicting appointment for this time slot.Please select different time slot.');
                    break;
                }
            }
        } 
    }
}