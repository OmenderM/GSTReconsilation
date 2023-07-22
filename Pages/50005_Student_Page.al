page 50005 "Student Page"
{


    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = 50003;
    Caption = 'Student Page';

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
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Download PDF")
            {
                ApplicationArea = All;
                Caption = 'Download Report in PDF';
                Image = Download;

                trigger OnAction();
                Var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: InStream;
                    RecRef: RecordRef;
                    FldRef: FieldRef;
                    recStudent: Record "Student Details";
                    DataCompression: Codeunit "Data Compression";
                    ZipFileName: Text[50];
                    PdfFileName: Text[50];
                    pdfStream: InStream;
                    parameter: Text;
                begin
                    recStudent.Reset();
                    //recStudent.SetRange(StudentName, rec.StudentName);
                    recStudent.FindSet();

                    TempBlob.CreateOutStream(OutS);
                    TempBlob.CreateInStream(InS);
                    RecRef.Open(50003);
                    RecRef.GetTable(recStudent);
                    // FldRef := RecRef.Field(Student.FieldNo(StudentName));
                    // FldRef.SetRange(Student.StudentName);
                    // if RecRef.FindFirst() then begin
                    Report.SaveAs(50003, parameter, ReportFormat::pdf, OutS, RecRef);
                    RecRef.Close();

                    ZipFileName := 'Report.pdf';
                    TempBlob.CreateOutStream(OutS);
                    TempBlob.CreateInStream(InS);
                    DownloadFromStream(InS, '', '', '', ZipFileName);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.SetCurrentKey(StudentName)
    end;


}