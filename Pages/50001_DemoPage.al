page 50001 DemoPage

{
    PageType = card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customers;



    layout
    {
        area(Content)
        {
            repeater(Employee)
            {
                field(EmployeeId; Rec.EmployeeId)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Id';

                }
                field(EmployeeNmae; Rec.EmployeeNmae)
                {
                    ApplicationArea = All;
                }

                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                }

                field(ContactNumber; Rec.ContactNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Contact Number';
                }

                field(EmployeeSalary; Rec.EmployeeSalary)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Salary';
                }

                field(EmployeeOrganizationDetails; Rec.EmployeeOrganisationDetails)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Organization Details';
                }

                field("Joining"; Rec.EmployeeJoiningDate)
                {
                    ApplicationArea = All;
                    Caption = 'EmpJDate';
                }
            }
        }
    }
    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction();
    //             begin

    //             end;
    //         }
    //     }
    // }
}