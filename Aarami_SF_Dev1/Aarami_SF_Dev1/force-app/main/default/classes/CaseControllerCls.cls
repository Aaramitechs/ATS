public class CaseControllerCls {
public list<Case>case_lst{get;set;}
public CaseControllerCls (){
case_lst=[select id, caseNumber,subject,description,origin from case ];
}
}