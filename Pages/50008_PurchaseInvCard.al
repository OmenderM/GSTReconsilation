// page 50008 PurchaseInvPage
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = 50007;

//     layout
//     {
//         area(Content)
//         {
//             group("Purchase Invoice")
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     trigger OnValidate()
//                     begin
//                         rec."Created By" := UserId;
//                         rec."Created Date" := DT2Date(CurrentDateTime);
//                         rec."Process By" := UserId;
//                         rec."Process Data" := CurrentDateTime;

//                     end;
//                 }
//                 field("Invoice Type"; Rec."Invoice Type")
//                 {
//                     ApplicationArea = All;
//                     caption = 'Invoice Type';
//                 }
//                 field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Buy-from Vendor No.';
//                 }
//                 field("Transaction Nature"; Rec."Transaction Nature")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Transaction Nature';
//                 }
//                 field("Order Address Code "; Rec."Order Address Code ")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Order Address Code';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Posting Date';
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Location Code';
//                 }
//                 field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Buy-from vendor Name';
//                 }
//                 field("Buy-from Address"; Rec."Buy-from Address")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Buy-from Address';
//                 }
//                 field("Buy-from Address 2"; Rec."Buy-from Address 2")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Buy-from Address 2';
//                 }
//                 field("Buy-from City"; Rec."Buy-from City")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Buy-from City';
//                 }
//                 field("Vendor Invoice Date"; Rec."Vendor Invoice Date")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Vendor Invoice Date';
//                 }
//                 field(State; Rec.State)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Claim ID"; Rec."Claim ID")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Claim ID';
//                 }
//                 field("Nature of supply"; Rec."Nature of supply")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Nature of Supply';
//                 }
//                 field("Post on Back Date"; Rec."Post on Back Date")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Post on Back-Date';
//                 }
//                 field("PO/Agreement"; Rec."PO/Agreement")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'PO/Agreement';
//                 }
//                 field("PO/Agreement No."; Rec."PO/Agreement No.")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'PO/Agreement No.';
//                 }
//                 field("PO/Agreement Date"; Rec."PO/Agreement Date")
//                 {
//                     ApplicationArea = all;
//                     caption = 'PO/Agreement Date';
//                 }
//                 field("Vendor Invoice No"; Rec."Vendor Invoice No")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Vendor Invoice No';
//                 }
//                 field("Line Number"; Rec."Line Number")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Line Number';
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Direct Unit Price"; Rec."Direct Unit Price")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Direct Unit Price';
//                 }
//                 field("Line Amount"; Rec."Line Amount")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Line Amount';
//                 }
//                 field("Gen.Prod.Posting Group"; Rec."Gen.Prod.Posting Group")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Gen.Prod.Posting Group';
//                 }
//                 field("TDS Applicability"; Rec."TDS Applicability")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'TDS Applicability';
//                 }
//                 field("TDS Remarks"; Rec."TDS Remarks")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'TDS Remarks';
//                 }
//                 field("Salvage value"; Rec."Salvage value")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Salvage Value';
//                 }
//                 field("TDS nature of deduction"; Rec."TDS nature of deduction")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Nature Of Deduction';
//                 }
//                 field("GST Group Code"; Rec."GST Group Code")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'GST Group Code';
//                 }
//                 field("HSN/SAC Code"; Rec."HSN/SAC Code")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'HSN/SAC';
//                 }
//                 field("GST Credit;"; Rec."Gst Credit")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'GST Credit';
//                 }
//                 field(Narration; Rec.Narration)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Cost Centre Code"; Rec."Cost Centre Code")
//                 {
//                     ApplicationArea = all;
//                     caption = 'Cost Centre Code';
//                 }
//                 field("Employee Code"; Rec."Employee Code")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Employee Code';
//                 }
//                 field("Month Code"; Rec."Month Code")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Month Code';
//                 }
//                 field("Vendor Code"; Rec."Vendor Code")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Vendor Code';
//                 }
//                 field("Ref-Field"; Rec."Ref-Field")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Ref-Field';
//                 }
//                 field("Company Code"; Rec."Company Code")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Company Code';
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Created By';
//                 }
//                 field("Created Date"; Rec."Created Date")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Created Date';
//                 }
//                 field("Process By"; Rec."Process By")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Process By';
//                 }
//                 field("Process Data"; Rec."Process Data")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Process Data';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Error; Rec.Error)
//                 {
//                     ApplicationArea = all;
//                 }



//             }
//         }
//     }


//     actions
//     {
//         area(Processing)
//         {
//             action(ActionName)
//             {
//                 ApplicationArea = All;

//                 trigger OnAction()
//                 begin

//                 end;
//             }
//         }
//     }


//     var
//         myInt: Integer;
// }