// table 50007 PurchaseInv
// {
//     DataClassification = ToBeClassified;
//     Caption = 'Purchase Invoice';

//     fields
//     {
//         field(50001; "No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50002; "Invoice Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Self Invoice","Taxable"; //To be check
//             caption = 'Invoice Type';
//         }
//         field(50003; "Buy-from Vendor No."; code[20])
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Buy-from Vendor No.';
//         }
//         field(50004; "Transaction Nature"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","GST Invoice","Non-GST Invoice","Registered RCM","Non-Registered RCM";
//             Caption = 'Transaction Nature';
//         }
//         field(50005; "Order Address Code "; code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Order Address Code';
//         }
//         field(50006; "Posting Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Posting Date';
//         }
//         field(50007; "Location Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Location Code';
//         }
//         field(50008; "Buy-from Vendor Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Buy-from Vendor Name';
//         }
//         field(50009; "Buy-from Address"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Buy-from Address';
//         }
//         field(50010; "Buy-from Address 2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Buy-from Address 2';
//         }
//         field(50011; "Buy-from City"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Buy-from City';
//         }
//         field(50012; "Vendor Invoice Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Vendor Invoice Date';
//         }
//         field(50013; State; code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50014; "Claim ID"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Claim ID';
//         }
//         field(50015; "Nature of supply"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Nature Of Supply';
//         }
//         field(50016; "Post on Back Date"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Post on Back-Date';
//         }
//         field(50017; "PO/Agreement"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "Yes","No";
//             Caption = 'PO/Agreement';
//         }
//         field(50018; "PO/Agreement No."; Text[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'PO/Agreement No.';
//         }
//         field(50019; "PO/Agreement Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'PO/Agreemnet No.';
//         }
//         field(50020; "Vendor Invoice No"; Code[35])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Vendor Invoice No.';
//         }
//         field(50021; "Line Number"; Integer)
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Line Number';
//         }
//         field(50022; "Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "G/L Accoount","Fixed Asset";
//         }
//         field(50023; Description; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50024; Quantity; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50025; "Direct Unit Price"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50026; "Line Amount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Line Amount';
//         }
//         field(50027; "Gen.Prod.Posting Group"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             caption = 'Gen. Prod. Posting Group';
//         }
//         field(50028; "TDS Applicability"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "Applicable","Not Applicable";
//             caption = 'TDS Aplicability';
//         }
//         field(50030; "TDS Remarks"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             caption = 'TDS Remarks';
//         }
//         field(50031; "Salvage value"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Salvage value';
//         }
//         field(50032; "TDS nature of deduction"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'TDS Nature of Deduction';
//         }
//         field(50033; "GST Group Code"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'GST Group Code';
//         }
//         field(50034; "HSN/SAC Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "HSN/SAC";
//         }
//         field(50035; "GST Credit"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "Availment","Non-Availment";
//             Caption = 'GST Credit';
//         }
//         field(50036; Narration; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50037; "Cost Centre Code"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Cost Centre Code';
//         }
//         field(50038; "Employee Code"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Employee Code';
//         }
//         field(50039; "Month Code"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Month Code';
//         }
//         field(50040; "Vendor Code"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Vendor Code';
//         }
//         field(50041; "Ref-Field"; code[10])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Ref-Field';
//         }
//         field(50042; "Company Code"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Company Code';
//         }
//         field(50043; "Created By"; Code[50])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50044; "Created Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50045; "Process By"; code[50])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50046; "Process Data"; DateTime)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50047; Status; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "Open","Process","Error";
//             Editable = false;
//         }
//         field(50048; Error; Text[250])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }



//     }
//     // keys
//     // {
//     //     // key(Key1; MyField)
//     //     // {
//     //     //     Clustered = true;
//     //     // }
//     // }

//     // var
//     //     myInt: Integer;

//     // trigger OnInsert()
//     // begin

//     // end;

//     // trigger OnModify()
//     // begin

//     // end;

//     // trigger OnDelete()
//     // begin

//     // end;

//     // trigger OnRename()
//     // begin

//     // end;

// }