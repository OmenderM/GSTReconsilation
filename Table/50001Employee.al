table 50101 Customers
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EmployeeId; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; EmployeeNmae; text[30])
        {
            DataClassification = ToBeClassified;

        }

        field(3; Designation; text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(4; ContactNumber; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(5; EmployeeSalary; decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(6; EmployeeOrganisationDetails; boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; EmployeeJoiningDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(key1; EmployeeNmae)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;



}