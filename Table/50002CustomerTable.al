table 50002 CustomerTable
{
    DataClassification = ToBeClassified;
    fields
    {


        field(1; "Custom"; code[40])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Customer Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }


        field(3; "Customer Type "; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Student Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Student Details";
            // trigger OnValidate()
            // var
            //     recStudent: Record "Student Details";
            // begin
            //     recStudent.Reset();
            //     recStudent.SetRange(StudentName, rec."Student Name");
            //     recStudent.FindFirst();
            //     rec.Class := recStudent.Class;
            //     //rec.RollNo := recStudent.RollNo;
            //     rec.Modify();
            // end;

        }
        field(5; Class; Text[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Student Details" where(StudentName = field("Student Name"));

        }
        field(6; RollNo; code[10])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Student Details"; //where(StudentName = field("Student Name"));

        }


    }



}