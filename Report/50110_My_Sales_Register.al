// report 50110 MySalesRegister
// {
//     UsageCategory = Administration;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Report\My_Sales_Register_50110.rdl';


//     dataset
//     {
//         dataitem("Sales Invoice Line"; "Sales Invoice Line")
//         {
//             // column(EInvoiceStatus; recSalesInvHeader."E-Invoice Status")
//             // {
//             // } 
//             column(IRNNo; recSalesInvHeader."IRN Hash")
//             {
//             }
//             column(EInvoiceAckNo; recSalesInvHeader."Acknowledgement No.")
//             {
//             }
//             column(EInvoiceAckDate; recSalesInvHeader."Acknowledgement Date")
//             {
//             }
//             // column(Narration; "Sales Invoice Line".Narration)
//             // {
//             // }
//             column(Month; recDimensionSetEntry."Dimension Value Name")
//             {
//             }
//             column(NatureOfSupply; recSalesInvHeader."Nature Of Supply")
//             {
//             }
//             column(TotalLineAmount; "Sales Invoice Line".Amount)
//             {
//             }
//             column(TaxAreaCode; "Sales Invoice Line"."Tax Area Code")
//             {
//             }
//             column(InvoiceType; recSalesInvHeader."Invoice Type")
//             {
//             }
//             column(GSTInvtype; Format(recSalesInvHeader."Invoice Type"))
//             {
//             }
//             column(SalesLineNo; "Sales Invoice Line"."Document No." + Format("Sales Invoice Line"."Line No.")) //Discuss
//             {
//             }
//             column(SerialNo; IntSrNo)
//             {
//             }
//             column(PartyName; txtPartyName)
//             {
//             }
//             column(PartyAddress; txtPartyAddress)
//             {
//             }
//             column(LocStateName; recLocationState.Description)
//             {
//             }
//             column(LocStateCode; recLocationState."State Code (GST Reg. No.)")
//             {
//             }
//             column(GSTStatus; Format(recSalesInvHeader."GST Customer Type"))
//             {
//             }
//             column(PartyGSTINNo; txtPartyGSTNo)
//             {
//             }
//             column(InvoiceNo; "Sales Invoice Line"."Document No.")
//             {
//             }
//             column(InvoiceDate; ("Sales Invoice Line"."Posting Date")) //Discuss
//             {
//             }
//             column(DiscountAmount; "Sales Invoice Line"."Line Discount Amount")
//             {
//             }
//             column(GoodService; Format("Sales Invoice Line"."GST Group Type"))
//             {
//             }
//             column(HSNCode; "Sales Invoice Line"."HSN/SAC Code")
//             {
//             }
//             // column(IGSTPerc; "Sales Invoice Line"."IGST %")
//             // {
//             // }
//             // column(IGSTAmount; "Sales Invoice Line"."IGST Amount")
//             // {
//             // }
//             // column(CGSTPerc; "Sales Invoice Line"."CGST %")
//             // {
//             // }
//             // column(CGSTAmount; "Sales Invoice Line"."CGST Amount")
//             // {
//             // }
//             // column(SGSTPerc; "Sales Invoice Line"."SGST %")
//             // {
//             // }
//             // column(SGSTAmount; "Sales Invoice Line"."SGST Amount")
//             // {
//             // }
//             column(POS; '')
//             {
//             }
//             column(ReverseCharge; 'Forward')
//             {
//             }
//             column(DocumentType; 'Invoice')
//             {
//             }
//             column(LocationGSTNo; recLocation."GST Registration No.")
//             {
//             }
//             column(LineType; "Sales Invoice Line".Type)
//             {
//             }
//             column(LineAccountNo; "Sales Invoice Line"."No.")
//             {
//             }
//             column(LineAccountName; "Sales Invoice Line".Description)
//             {
//             }
//             column(LineQty; "Sales Invoice Line".Quantity)
//             {
//             }
//             column(LineUnitRate; "Sales Invoice Line"."Unit Price")
//             {
//             }
//             column(LineDiscount; "Sales Invoice Line"."Line Discount Amount")
//             {
//             }
//             column(PlaceOfSupply; recState.Description)
//             {
//             }
//             column(PlaceOfSupplyStateCode; recState."State Code (GST Reg. No.)")
//             {
//             }
//             column(ItemCategory; "Sales Invoice Line"."Item Category Code")
//             {
//             }
//             column(ProductGroup; '')
//             {
//             }
//             column(GenBusGroup; "Sales Invoice Line"."Gen. Bus. Posting Group")
//             {
//             }
//             column(GenProdGroup; "Sales Invoice Line"."Gen. Prod. Posting Group")
//             {
//             }
//             column(CustomerPostingGroup; recSalesInvHeader."Customer Posting Group")
//             {
//             }
//             column(InventoryPostingGroup; "Sales Invoice Line"."Posting Group")
//             {
//             }
//             trigger OnAfterGetRecord()
//             begin
//                 IF recHSN.GET("Sales Invoice Line"."HSN/SAC Code") THEN BEGIN
//                     recHSN.TESTFIELD(Type);
//                     IF recHSN.Type = recHSN.Type::HSN THEN
//                         txtGoodService := 'Goods'
//                     ELSE
//                         txtGoodService := 'Service';
//                 END ELSE
//                     txtGoodService := '';

//                 recSalesInvHeader.GET("Sales Invoice Line"."Document No.");
//                 IF recSalesInvHeader."Ship-to Code" = '' THEN BEGIN
//                     recCustomer.GET("Sales Invoice Line"."Sell-to Customer No.");
//                     txtPartyName := recCustomer.Name;
//                     txtPartyAddress := recCustomer.Address + ' ' + recCustomer."Address 2";
//                     txtPartyGSTNo := recCustomer."GST Registration No.";
//                     IF NOT recState.GET(recCustomer."State Code") THEN
//                         recState.INIT;
//                 END ELSE BEGIN
//                     recShipToAddress.GET(recSalesInvHeader."Sell-to Customer No.", recSalesInvHeader."Ship-to Code");
//                     txtPartyName := recShipToAddress.Name;
//                     txtPartyAddress := recShipToAddress.Address + ' ' + recShipToAddress."Address 2";
//                     txtPartyGSTNo := recShipToAddress."GST Registration No.";
//                     IF NOT recState.GET(recShipToAddress.State) THEN
//                         recState.INIT;
//                 END;

//                 intSrNo += 1;
//                 IF NOT recLocation.GET("Sales Invoice Line"."Location Code") THEN
//                     recLocation.INIT;
//                 IF NOT recLocationState.GET(recLocation."State Code") THEN
//                     recLocationState.INIT;


//             end;

//             trigger OnPreDataItem()
//             BEGIN
//                 IF txtLocationCodeFilter <> '' THEN
//                     "Sales Invoice Line".SETFILTER("Location Code", txtLocationCodeFilter);

//                 IF cdPartyCode <> '' THEN
//                     "Sales Invoice Line".SETRANGE("Sell-to Customer No.", cdPartyCode);

//                 IF cdInterIntra <> '' THEN
//                     "Sales Invoice Line".SETRANGE("Tax Area Code", cdInterIntra);

//                 "Sales Invoice Line".SetRange("Posting Date", dtFromDate, dtToDate);


//             END;
//         }

//         dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
//         {
//             // column(CrEInvoiceStatus; recSalesCrMemoHeader."E-Invoice Status")
//             // {
//             // }
//             column(CrIRNNo; recSalesCrMemoHeader."IRN Hash")
//             {
//             }
//             column(CrEInvoiceAckNo; recSalesCrMemoHeader."Acknowledgement No.")
//             {
//             }
//             column(CrEInvoiceAckDate; recSalesCrMemoHeader."Acknowledgement Date")
//             {
//             }
//             // column(CrNarration; "Sales Cr.Memo Line".Narration)
//             // {
//             // }
//             column(CrMonth; recDimensionSetEntry."Dimension Value Name")
//             {
//             }
//             column(CrOriginalInvDate; recSalesInvHeader."Posting Date")
//             {
//             }
//             // column(CrOriginalInvNo; recSalesCrMemoHeader."Original Invoice No.")
//             // {
//             // }
//             column(CrNatureOfSupply; recSalesCrMemoHeader."Nature of Supply")
//             {
//             }
//             column(CrTotalLineAmount; -"Sales Cr.Memo Line".Amount) //"Amount To Customer"
//             {
//             }
//             column(CrTaxAreaCode; "Sales Cr.Memo Line"."Tax Area Code")
//             {
//             }
//             column(CrInvoiceType; recSalesCrMemoHeader."Invoice Type")
//             {
//             }
//             column(CrGSTInvoiceType; FORMAT(recSalesCrMemoHeader."Invoice Type"))
//             {
//             }
//             column(CrSalesLineNo; "Sales Cr.Memo Line"."Document No." + FORMAT("Sales Cr.Memo Line"."Line No."))
//             {
//             }
//             column(CrSerialNo; intSrNo)
//             {
//             }
//             column(CrPartyName; txtPartyName)
//             {
//             }
//             column(CrPartyAddress; txtPartyAddress)
//             {
//             }
//             column(CrLocStateName; recLocationState.Description)
//             {
//             }
//             column(CrLocStateCode; recLocationState."State Code (GST Reg. No.)")
//             {
//             }
//             column(CrGSTStatus; FORMAT(recSalesCrMemoHeader."GST Customer Type"))
//             {
//             }
//             column(CrPartyGSTINNo; txtPartyGSTNo)
//             {
//             }
//             column(CrInvoiceNo; "Sales Cr.Memo Line"."Document No.")
//             {
//             }
//             column(CrInvoiceDate; '04-02-2023') // Formatdate Remove By Iappc
//             {
//             }
//             column(CrDiscountAmount; -"Sales Cr.Memo Line"."Line Discount Amount")
//             {
//             }
//             column(CrLineAmount; -"Sales Cr.Memo Line"."Line Amount")
//             {
//             }
//             column(CrGoodsService; Format("Sales Cr.Memo Line"."GST Group Type"))
//             {
//             }
//             column(CrHSNCode; "Sales Cr.Memo Line"."HSN/SAC Code")
//             {
//             }
//             // column(CrIGSTPerc; "Sales Cr.Memo Line"."IGST %")
//             // {
//             // }
//             // column(CrIGSTAmount; "Sales Cr.Memo Line"."IGST Amount")
//             // {
//             // }
//             // column(CrCGSTPerc; "Sales Cr.Memo Line"."CGST %")
//             // {
//             // }
//             // column(CrCGSTAmount; "Sales Cr.Memo Line"."CGST Amount")
//             // {
//             // }
//             // column(CrSGSTPerc; "Sales Cr.Memo Line"."SGST %")
//             // {
//             // }
//             // column(CrSGSTAmount; "Sales Cr.Memo Line"."SGST Amount")
//             // {
//             // }
//             column(CrPOS; '')
//             {
//             }
//             column(CrReverseCharge; 'Forward')
//             {
//             }
//             column(CrDocumentType; 'Credit Memo')
//             {
//             }
//             column(CrLocationGSTNo; recLocation."GST Registration No.")
//             {
//             }
//             column(CrLineType; "Sales Cr.Memo Line".Type)
//             {
//             }
//             column(CrLineAccountCode; "Sales Cr.Memo Line"."No.")
//             {
//             }
//             column(CrLineAccountName; "Sales Cr.Memo Line".Description)
//             {
//             }
//             column(CrLineQty; "Sales Cr.Memo Line".Quantity)
//             {
//             }
//             column(CrLineUnitRate; "Sales Cr.Memo Line"."Unit Price")
//             {
//             }
//             column(CrLineDiscount; "Sales Cr.Memo Line"."Line Discount Amount")
//             {
//             }
//             column(CrPlaceOfSupply; recState.Description)
//             {
//             }
//             column(CrPlaceOfSupplyStateCode; recState."State Code (GST Reg. No.)")
//             {
//             }
//             column(CrItemCategory; "Sales Cr.Memo Line"."Item Category Code")
//             {
//             }
//             column(CrPorudctGroup; '')
//             {
//             }
//             column(CrGenBusGroup; "Sales Cr.Memo Line"."Gen. Bus. Posting Group")
//             {
//             }
//             column(CrGenProdGroup; "Sales Cr.Memo Line"."Gen. Prod. Posting Group")
//             {
//             }
//             column(CrCustomerPostingGroup; recSalesCrMemoHeader."Customer Posting Group")
//             {
//             }
//             column(CrInventoryPostingGroup; "Sales Cr.Memo Line"."Posting Group")
//             {
//             }

//             trigger OnAfterGetRecord()
//             BEGIN
//                 IF recHSN.Get("Sales Cr.Memo Line"."HSN/SAC Code") Then BEGIN
//                     recHSN.TestField(Type);
//                     IF recHSN.Type = recHSN.Type::HSN Then
//                         txtGoodService := 'Good'
//                     ELSE
//                         txtGoodService := 'Service';
//                 END ELSE
//                     txtGoodService := '';

//                 // recDimensionSetEntry.RESET;
//                 // recDimensionSetEntry.SETRANGE("Dimension Set ID", "Sales Cr.Memo Line"."Dimension Set ID");
//                 // recDimensionSetEntry.SETRANGE("Dimension Code", 'MONTH');
//                 // IF NOT recDimensionSetEntry.FINDFIRST THEN
//                 //     recDimensionSetEntry.INIT
//                 // ELSE
//                 //     recDimensionSetEntry.CALCFIELDS("Dimension Value Name");

//                 recSalesCrMemoHeader.GET("Sales Cr.Memo Line"."Document No.");
//                 IF recSalesCrMemoHeader."Ship-to Code" = '' THEN BEGIN
//                     recCustomer.GET("Sales Cr.Memo Line"."Sell-to Customer No.");
//                     txtPartyName := recCustomer.Name;
//                     txtPartyAddress := recCustomer.Address + ' ' + recCustomer."Address 2";
//                     txtPartyGSTNo := recCustomer."GST Registration No.";
//                     IF NOT recState.GET(recCustomer."State Code") THEN
//                         recState.INIT;

//                     IF (cdPartyState <> '') AND (cdPartyState <> recState.Code) THEN
//                         CurrReport.Skip();

//                 END ELSE BEGIN
//                     recShipToAddress.Get(recSalesCrMemoHeader."Sell-to Customer No.", recSalesCrMemoHeader."Ship-to Code");
//                     txtPartyName := recShipToAddress.Name;
//                     txtPartyName := recShipToAddress.Address + '' + recShipToAddress."Address 2";
//                     txtPartyGSTNo := recShipToAddress."GST Registration No.";
//                     IF NOT recState.Get(recShipToAddress.State) then
//                         recState.INIT;

//                     IF (cdPartyState <> '') AND (cdPartyState <> recState.Code) THEN
//                         CurrReport.Skip();
//                 END;

//                 // IF NOT recSalesInvHeader.Get(recSalesCrMemoHeader."Original Invoice No") THEN
//                 //     recSalesInvHeader.INIT;

//                 IntSrNo += 1;
//                 IF NOT recLocation.get("Sales Cr.Memo Line"."Location Code") THEN
//                     recLocation.INIT;
//                 IF NOT recLocationState.get(recLocation."State Code") THEN
//                     recLocationState.INIT;

//                 // ""Sales Cr.Memo Line"".CalcFields("IGST %", "CGST %", "SGST %", "IGST Amount", "SGST Amount", "CGST Amount");
//             END;

//             trigger OnPreDataItem()
//             BEGIN
//                 IF txtLocationFilter <> '' THEN
//                     "Sales Cr.Memo Line".SetFilter("Location Code", txtLocationFilter);
//                 IF cdPartyCode <> '' THEN
//                     "Sales Cr.Memo Line".SetFilter("Sell-to Customer No.", cdPartyCode);
//                 IF cdInterIntra <> '' THEN
//                     "Sales Cr.Memo Line".SetFilter("Tax Area Code", cdInterIntra);


//             END;

//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {

//                 // field("GST Registration No."; cdGSTRegistrationNo)
//                 // {
//                 //     ApplicationArea = All;
//                 //     TableRelation = "GST Registration Nos.";
//                 // }
//                 field("From Date"; dtFromDate)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("To Date"; dtToDate)
//                 {
//                     ApplicationArea = All;
//                 }
//                 // field("Customer Code"; cdPartyCode)
//                 // {
//                 //     ApplicationArea = All;
//                 //     TableRelation = Customer;
//                 // }
//                 // field("Inter / Intra State"; cdInterIntra)
//                 // {
//                 //     ApplicationArea = All;
//                 //     TableRelation = "Tax Area";
//                 // }
//                 // field("Nature Of Supply"; cdInterIntra)
//                 // {
//                 //     ApplicationArea = All;
//                 // }
//                 // field("Location State"; cdPartyState)
//                 // {
//                 //     ApplicationArea = All;
//                 //     TableRelation = State;
//                 // }


//             }
//         }
//     }

//     var
//         Intcounter: Integer;
//         recCustomer: Record Customer;
//         recSalesInvHeader: Record "Sales Invoice Header";
//         recSalesInvLine: Record "Sales Invoice Line";
//         recDimensionSetEntry: Record "Dimension Set Entry";
//         recSalesCrMemoHeader: Record "Sales Cr.Memo Header";
//         recSalesCrMemoLine: Record "Sales Cr.Memo Line";
//         recShipToAddress: Record "Ship-to Address";
//         recHSN: Record "HSN/SAC";
//         recLocation: Record Location;
//         recState: Record State;
//         recLocationState: Record State;
//         cdGSTRegistrationNo: Code[20];
//         cdInterIntra: Code[20];
//         cdPartyCode: Code[20];
//         cdPartyState: Code[20];
//         dtFromDate: Date;
//         dtToDate: Date;
//         IntSrNo: Integer;
//         txtPartyName: Text;
//         txtPartyAddress: Text;
//         txtPartyGSTNo: Text;
//         txtLocationFilter: Text;
//         txtLocationCodeFilter: Text;
//         txtGoodService: Text[30];
//         opGoodsService: Option " ",Good,Service;
// }

