xmlport 50002 StudentXMLPort
{
    Direction = import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(StudentDataImport)
        {

            tableelement(Student; "Student Details")
            {
                AutoSave = false;

                textelement(StudentName)
                {
                    MinOccurs = Zero;
                }

                textelement(Class)
                {
                    MinOccurs = Zero;
                }

                textelement(Subject)
                {
                    MinOccurs = Zero;
                }

                textelement(RollNo)
                {
                    MinOccurs = Zero;
                }

                textelement(SchoolName)
                {
                    MinOccurs = Zero;
                }

                textelement(ContactNumber)
                {
                    MinOccurs = Zero;
                }

                textelement(Address)
                {
                    MinOccurs = Zero;
                }

                textelement(EmailId)
                {
                    MinOccurs = Zero;
                }


                trigger OnAfterInsertRecord()
                begin
                    intcounter += 1;
                    if (intcounter > 1) and (StudentName <> '') then begin

                        recstudent.Reset();
                        recstudent.SetRange(recstudent.StudentName, StudentName);
                        if not recstudent.FindFirst() then begin
                            recstudent.Init();
                            recstudent.StudentName := StudentName;
                            recstudent.Class := Class;
                            recstudent.RollNo := RollNo;
                            recstudent.SchoolName := SchoolName;
                            recstudent.ContactNumber := ContactNumber;
                            recstudent.Address := Address;
                            recstudent.EmailId := EmailId;
                            recstudent.insert();
                        end else begin
                            recstudent.class := class;
                            recstudent.RollNo := RollNo;
                            recstudent.SchoolName := SchoolName;
                            recstudent.ContactNumber := ContactNumber;
                            recstudent.Address := Address;
                            recstudent.EmailId := EmailId;
                            recstudent.Modify();
                        end;

                    end;

                end;

            }
        }
    }

    trigger OnPostXmlPort();
    begin
        if (recstudent.StudentName <> '') then begin

            Message('Not Uploaded');

        end else begin

            Message('Data Import Successfully');

        end;
    end;

    var
        intcounter: Integer;
        recstudent: Record "Student Details";
        cdcode: code[20];


}


