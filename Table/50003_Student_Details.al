table 50003 "Student Details"
{
    Caption = 'Student Form';

    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Name';
            NotBlank = true;

        }

        field(2; Class; Text[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;

        }

        field(3; Subject; Option)
        {
            OptionMembers = " ","English","Maths",Science;
        }

        field(4; RollNo; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }

        field(5; SchoolName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'School Name';
            NotBlank = true;
        }

        field(6; ContactNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'C.No';
            NotBlank = true;
        }

        field(7; Address; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Address';
        }

        field(8; EmailId; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mail';
        }
        field(9; "School No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Tname; Text[5])
        {
            DataClassification = ToBeClassified;
        }

        // field(9; "Customer Id"; Code[40])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = CustomerTable;
        //     trigger OnValidate()
        //     Var
        //         recCustomer: Record CustomerTable;
        //     begin
        //         recCustomer.Reset();
        //         recCustomer.SetRange("Customer Id", rec."Customer Id");
        //         recCustomer.FindFirst();
        //         rec."Customer Name" := recCustomer."Customer Name";
        //         rec.Modify();
        //     end;
        // }
        // field(10; "Customer Name"; Text[100])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = CustomerTable; //where("Customer Id" = field("Customer Id"));
        // }
    }

    // keys
    // {
    //     key(RollNo; RollNo)
    //     {
    //         Clustered = true;
    //     }
    //     key(Key2; SchoolName, Class, ContactNumber)
    //     {
    //     }
    // }

    var
        myInt: Integer;


    // trigger OnInsert()
    // begin

    //     if StudentName <> '' then begin
    //         Message('Data is inserted');
    //     end else
    //         Message('Data is not inserted');
    // end;

    trigger OnModify()
    begin
        Message('Data is Modified');
    end;

    trigger OnDelete()
    begin
        Message('Data is Deleted');
    end;

    trigger OnRename()
    begin
        Message('Record is renamed');
    end;

}