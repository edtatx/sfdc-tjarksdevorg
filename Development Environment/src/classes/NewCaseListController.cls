public class NewCaseListController {
	
    private string caseStatus = 'New';
    
    public List<Case> getNewCases() {
      List<Case> results = Database.query(
            'SELECT Id, CaseNumber, Status, CreatedDate ' +
          'FROM Case WHERE Status = :caseStatus');
        return results;  
    }
}