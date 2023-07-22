report 50003 StudentReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Student Report';
    RDLCLayout = 'Report\StudentReport_50003.rdl';


    dataset
    {
        dataitem("Student Details"; "Student Details")
        {
            column(StudentName; StudentName) { }
            column(Class; Class) { }
            column(Subject; Subject) { }
            column(RollNo; RollNo) { }
            column(SchoolName; SchoolName) { }
            column(ContactNumber; ContactNumber) { }
            column(Address; Address) { }
            column(EmailId; EmailId) { }
        }
    }

    var
        myInt: Integer;
}