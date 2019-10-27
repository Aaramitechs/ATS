public class ApexSharing_Demo {
// this method will share the Resource data to the other user
    // using Apex Share Object
    public static void share_resource_to_Manager(String recId, String userId ){
        RESOURCE__share rs = new RESOURCE__share();
        //SELECT AccessLevel,ParentId,RowCause,UserOrGroupId FROM RESOURCE__share
        rs.RowCause = 'Manual';
        rs.ParentId = recId;
        rs.UserOrGroupId = userId;
        rs.AccessLevel = 'Read'; // possible values Edit /Read / All
        insert rs;
    }
    
    /*
    String rcId = 'a086F000029fEpi';
    String usrId = '0056F00000Aep64';
    ApexSharing_Example_class.share_resource_to_Manager(rcId, usrId);
    */
    
}