public class AppointmentBooking {
    @AuraEnabled
    public static List<Meeting__C> getMeetings(){
        list<Meeting__C> lstMeetings = [Select Id,Name, Start_Time__c, End_Time__c,isConfirmed__C
                                        FROM Meeting__c 
                                        WHERE Meeting_Requestor__c =: Userinfo.getUserId()];
        system.debug('Events '+lstMeetings);
        return lstMeetings;
    }
	
}