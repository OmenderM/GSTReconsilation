page 50006 StudentCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50003;
    Caption = 'Student card';

    layout
    {
        area(Content)
        {
            repeater(Student_Details)
            {
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }


                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    Caption = 'Class';
                }


                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                    Caption = 'Subject';
                }


                field(RollNo; Rec.RollNo)
                {
                    ApplicationArea = All;
                    Caption = 'Roll No.';
                }


                field(SchoolName; Rec.SchoolName)
                {
                    ApplicationArea = All;
                    Caption = 'School Name';
                }


                field(ContactNumber; Rec.ContactNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Contact Number';
                }


                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Student Address';
                }


                field(EmailId; Rec.EmailId)
                {
                    ApplicationArea = All;
                    Caption = 'Email Id';
                }
                field("School No"; Rec."School No")
                {
                    ApplicationArea = All;
                }
                field(Tname; Rec.Tname)
                {
                    ApplicationArea = All;
                }
                // field("Customer Id"; Rec."Customer Id")
                // {
                //     ApplicationArea = all;
                // }
                // field("Customer Name"; Rec."Customer Name")
                // {
                //     ApplicationArea = all;
                // }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Print")
            {
                ApplicationArea = All;
                Image = Print;
                Caption = 'Print Report';
                //RunObject = XMLPort StudentXMLPort;

                trigger OnAction();
                var
                    recStudent: Record "Student Details";
                begin
                    Report.Run(50003, true, true, recStudent);
                end;


            }
            // action("")
            // {
            //     ApplicationArea = "All";
            //     Image = Print;
            //     Caption = 'Print Record';

            //     // trigger OnAction();
            //     // var
            //     //     recstudent: Record "Student Details";

            //     // begin
            //     //     recstudent.Reset();
            //     //     recstudent.SetRange(StudentName);
            //     //     recstudent.FindFirst();
            //     //     Report.Run(50003, true, true, recstudent);

            //     // end;
            // }

        }
    }

}