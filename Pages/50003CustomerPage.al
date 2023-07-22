page 50003 CustomerPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Customer Page';
    SourceTable = 50002;

    layout
    {
        area(Content)
        {
            repeater(CustomerTable)
            {
                field("Customer Id"; Rec."Customer Id")
                {
                    ApplicationArea = All;
                    Caption = 'Id';

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }

                field("Customer Type "; Rec."Customer Type ")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = all;
                    Caption = 'Student Name';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = all;
                }
                field(RollNo; Rec.RollNo)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}