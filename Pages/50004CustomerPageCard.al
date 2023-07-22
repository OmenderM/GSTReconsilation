// page 50004 CustomerPageCard
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     Caption = 'Customer Card';
//     SourceTable = 50002;

//     layout
//     {
//         area(Content)
//         {
//             repeater(CustomerTable)
//             {
//                 field("Customer Id"; Rec."Customer Id")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Id';
//                 }
//                 field("Customer Name"; Rec."Customer Name")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Name';
//                 }

//                 field("Customer Type "; Rec."Customer Type ")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Type';
//                 }
//                 field("Student Name"; Rec."Student Name")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Student Name';
//                 }
//                 field(Class; Rec.Class)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(RollNo; Rec.RollNo)
//                 {
//                     ApplicationArea = all;
//                 }
//             }


//         }
//         area(Factboxes)
//         {

//         }
//     }

//     actions
//     {

//         area(Processing)
//         {

//             action("Import Data")
//             {
//                 ApplicationArea = All;
//                 Image = Import;
//                 RunObject = xmlport MyXmlport;

//                 trigger OnAction();
//                 begin
//                 end;
//             }
//             action("Sales Register")
//             {
//                 ApplicationArea = All;
//                 Image = Report;
//                 RunObject = report MySalesRegister;

//                 trigger OnAction();
//                 begin
//                 end;
//             }

//             action("Proforma Invoice")
//             {
//                 ApplicationArea = all;
//                 Image = Report;
//                 RunObject = Report ProformaInv;
//             }

//             action(print)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Print';
//                 Image = Print;

//                 trigger OnAction()
//                 var
//                     reccustomerTable: Record CustomerTable;
//                 begin
//                     reccustomerTable.reset();
//                     reccustomerTable.SetRange("Customer Id");
//                     reccustomerTable.FindFirst();
//                     Report.Run(50110, true, true, reccustomerTable);
//                 end;
//             }


//         }


//     }

// }





