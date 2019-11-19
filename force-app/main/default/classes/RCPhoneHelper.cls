global class RCPhoneHelper {
	webService static Contact searchContact(String phone) {
        List<List<SObject>> l = [FIND :phone IN PHONE FIELDS RETURNING Contact(Id limit 1)];
        if(l.size() > 0 && l[0].size() > 0) {
            String id = ((Contact)l[0][0]).Id;
            return [select Id, Name from Contact where Id=:id limit 1];
        }
        return null;
    }
}