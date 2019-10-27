global class SOAP_Webservice_Exps_Exmple_Nov26 {
        global class AccountInfo {
        webservice String AcctName;
        webservice Integer AcctNumber;
    }
    
    
    webservice static Account createAccount(AccountInfo info) {
        Account acct = new Account();
        acct.Name = info.AcctName;
        acct.AccountNumber = String.valueOf(info.AcctNumber);
        insert acct;
        return acct;
    }
    
    webservice static Account getAccount(String actId) {
        Account acct = [Select id,name, AnnualRevenue from Account where id=: actId];
        return acct;
    }
    
    webservice static Id [] createAccounts(AccountInfo parent,
                                           AccountInfo child, AccountInfo grandChild) {
        Account prnt = createAccount(parent);
        insert prnt;
        Account chld = createAccount(child);
        chld.parentId = prnt.Id;
        insert chld;
        
        Account grntChld = createAccount(child);
        grntChld.parentId = chld.Id;
        insert grntChld;
        
        Id [] results = new Id[3];
        results[0] = prnt.Id;
        results[1] = chld.Id;
        results[2] = grntChld.Id;
        return results;
    }

}