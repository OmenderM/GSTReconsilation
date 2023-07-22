// report 50149 ProformaInv
// {
//     UsageCategory = Administration;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Report\500149-ProformaInvoice.rdl';

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             DataItemTableView = SORTING("No.");

//             column(CompanyName; recCompanyInfo.Name) { }
//             column(CompanyLogo; recCompanyInfo.Picture) { }
//             column(CompanyAddress; recLocation.Address) { }
//             column(CompanyAddress1; recLocation."Address 2") { }
//             column(CompanyCity; recLocation.City) { }
//             column(CompanyPostCode; recLocation."Post Code") { }
//             column(CompanyState; txtCompanyState) { }
//             column(CompanyCountry; txtCompanyCountry) { }
//             column(CompanyPhoneNo; recLocation."Phone No.") { }
//             column(CompanyEmail; recLocation."E-Mail") { }
//             //column(CompanyCIN; recCompanyInfo."C.I.N. No.") { }
//             column(CompanyPAN; recCompanyInfo."P.A.N. No.") { }
//             column(CompanyGST; recLocation."GST Registration No.") { }
//             column(CompanyStateCode; cdCompanyStateCode + ' (' + txtCompanyState + ')') { }
//             column(CustomerName; recCustomer.Name) { }
//             column(CustomerAddress; recCustomer.Address) { }
//             column(CustomerAddress1; recCustomer."Address 2") { }
//             column(CustomerCity; recCustomer.City) { }
//             column(CustomerPostCode; recCustomer."Post Code") { }
//             column(CustomerState; txtCustomerState) { }
//             column(CustomerStateCode; cdCustomerStateCode + ' (' + txtCustomerState + ')') { }
//             column(CustomerCountry; txtCustomerCountry) { }
//             column(CustomerPAN; recCustomer."P.A.N. No.") { }
//             column(CustomerGST; "Sales Header"."Customer GST Reg. No.") { }
//             column(ShipToName; txtShipToAddress[1]) { }
//             column(ShipToAddress; txtShipToAddress[2]) { }
//             column(ShipToAddress1; txtShipToAddress[3]) { }
//             column(ShipToCity; txtShipToAddress[4]) { }
//             column(ShipToPostCode; txtShipToAddress[5]) { }
//             column(ShipToState; txtShipToAddress[6]) { }
//             column(ShipToCountry; txtShipToAddress[7]) { }
//             column(ShipToGST; txtShipToAddress[8]) { }
//             column(InvoiceNo; "Sales Header"."No.") { }
//             column(InvoiceDate; Format("Sales Header"."Posting Date")) { }
//             column(OrderNo; "Sales Header"."Your Reference") { }
//             column(OrderDate; Format("Sales Header"."Order Date")) { }
//             column(PaymentTerm; recPaymentTerms.Description) { }
//             column(RoundOffAmount; decRoundoffAmount) { }
//             column(CurrencySymbol; txtCurrencySymbol) { }
//             column(BankName; recCompanyInfo."Bank Name") { }
//             column(BankAccountNo; recCompanyInfo."Bank Account No.") { }
//             //column(IFSCCode; recCompanyInfo."IFSC Code") { }
//             column(Declaration1; '1. Details given in the Invoice are true and correct.') { }
//             column(Declaration2; '2. All disputes subject to Delhi jurisdiction.') { }
//             column(AmountInWords; txtAmountInWords[1] + txtAmountInWords[2]) { }
//             column(BillToContact; recCustomer.Contact) { }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) where("System-Created Entry" = const(false), "Qty. to Invoice" = filter(<> 0));
//                 DataItemLink = "Document No." = FIELD("No.");

//                 column(LineNo; "Sales Line"."Line No.") { }
//                 column(SrNo; intSrNo) { }
//                 column(ItemDescription; "Sales Line".Description) { }
//                 column(HSNSAC; "Sales Line"."HSN/SAC Code") { }
//                 column(LineQuantity; "Sales Line"."Qty. to Invoice") { }
//                 column(ItemUOM; "Sales Line"."Unit of Measure Code") { }
//                 column(UnitPrice; "Sales Line"."Unit Price") { }
//                 column(DiscountPerc; "Sales Line"."Line Discount %") { }
//                 column(GSTPerc; decIGSTPerc + decCGSTPerc + decSGSTPerc) { }
//                 column(GSTAmount; decIGSTAmount + decCGSTAmount + decSGSTAmount) { }
//                 column(LineAmount; decLineAmount) { }

//                 trigger OnPreDataItem()
//                 begin
//                     intSrNo := 0;
//                     recGSTSummary.Reset();
//                     recGSTSummary.DeleteAll();
//                     intEntryNo := 0;
//                 end;

//                 trigger OnAfterGetRecord()
//                 begin
//                     intSrNo += 1;
//                     decIGSTAmount := 0;
//                     decIGSTPerc := 0;
//                     decCGSTAmount := 0;
//                     decCGSTPerc := 0;
//                     decSGSTAmount := 0;
//                     decSGSTPerc := 0;

//                     recTaxTransactions.Reset();
//                     recTaxTransactions.SetRange("Tax Record ID", "Sales Line".RecordId);
//                     recTaxTransactions.SetRange("Tax Type", 'GST');
//                     recTaxTransactions.SetRange("Value Type", recTaxTransactions."Value Type"::COMPONENT);
//                     recTaxTransactions.SetRange("Value ID", 2);
//                     if recTaxTransactions.FindFirst() then begin
//                         decCGSTAmount := recTaxTransactions."Amount (LCY)";
//                         decCGSTPerc := recTaxTransactions.Percent;
//                     end;
//                     recTaxTransactions.SetRange("Value ID", 3);
//                     if recTaxTransactions.FindFirst() then begin
//                         decIGSTAmount := recTaxTransactions."Amount (LCY)";
//                         decIGSTPerc := recTaxTransactions.Percent;
//                     end;
//                     recTaxTransactions.SetRange("Value ID", 6);
//                     if recTaxTransactions.FindFirst() then begin
//                         decSGSTAmount := recTaxTransactions."Amount (LCY)";
//                         decSGSTPerc := recTaxTransactions.Percent;
//                     end;
//                     recTaxTransactions.SetRange("Value ID", 10);
//                     if recTaxTransactions.FindFirst() then begin
//                         decGSTBaseAmount := recTaxTransactions."Amount (LCY)";
//                     end;

//                     decDivisionFactor := "Sales Line"."Qty. to Invoice" / "Sales Line".Quantity;
//                     decIGSTAmount := Round(decIGSTAmount * decDivisionFactor, 0.01);
//                     decCGSTAmount := Round(decCGSTAmount * decDivisionFactor, 0.01);
//                     decSGSTAmount := Round(decSGSTAmount * decDivisionFactor, 0.01);
//                     decLineAmount := Round("Sales Line"."Line Amount" * decDivisionFactor, 0.01);
//                     decLineAmount := decLineAmount + decIGSTAmount + decCGSTAmount + decSGSTAmount;

//                     recGSTSummary.Reset();
//                     recGSTSummary.SetRange("HSN/SAC Code", "Sales Line"."HSN/SAC Code");
//                     if recGSTSummary.FindFirst() then begin
//                         recGSTSummary."GST Base Amount" += Round(decGSTBaseAmount * decDivisionFactor, 0.01);
//                         recGSTSummary."GST Amount" += Round(decIGSTAmount * decDivisionFactor, 0.01);
//                         recGSTSummary."Custom Duty Amount (LCY)" += Round(decCGSTAmount * decDivisionFactor, 0.01);
//                         recGSTSummary."Cess Amount Per Unit Factor" += Round(decSGSTAmount * decDivisionFactor, 0.01);
//                         recGSTSummary.Modify();
//                     end else begin
//                         recGSTSummary.Init();
//                         intEntryNo += 1;
//                         recGSTSummary."Entry No." := intEntryNo;
//                         recGSTSummary."HSN/SAC Code" := "Sales Line"."HSN/SAC Code";
//                         recGSTSummary."GST Base Amount" := Round(decGSTBaseAmount * decDivisionFactor, 0.01);
//                         recGSTSummary."GST %" := decIGSTPerc;
//                         recGSTSummary."GST Amount" := Round(decIGSTAmount * decDivisionFactor, 0.01);
//                         recGSTSummary."Custom Duty Amount" := decCGSTPerc;
//                         recGSTSummary."Custom Duty Amount (LCY)" := Round(decCGSTAmount * decDivisionFactor, 0.01);
//                         recGSTSummary."Cess Factor Quantity" := decSGSTPerc;
//                         recGSTSummary."Cess Amount Per Unit Factor" := Round(decSGSTAmount * decDivisionFactor, 0.01);
//                         recGSTSummary.Insert();
//                     end;
//                 end;
//             }
//             dataitem(GSTSummary; Integer)
//             {
//                 DataItemTableView = sorting(Number) order(ascending);

//                 column(SummarySrNo; recGSTSummary."Entry No.") { }
//                 column(SummaryHSNSAC; recGSTSummary."HSN/SAC Code") { }
//                 column(TaxableValue; recGSTSummary."GST Base Amount") { }
//                 column(IGSTPerc; recGSTSummary."GST %") { }
//                 column(IGSTAmount; recGSTSummary."GST Amount") { }
//                 column(CGSTPerc; recGSTSummary."Custom Duty Amount") { }
//                 column(CGSTAmount; recGSTSummary."Custom Duty Amount (LCY)") { }
//                 column(SGSTPerc; recGSTSummary."Cess Factor Quantity") { }
//                 column(SGSTAmount; recGSTSummary."Cess Amount Per Unit Factor") { }

//                 trigger OnPreDataItem()
//                 begin
//                     recGSTSummary.Reset();
//                     GSTSummary.SetRange(Number, 1, recGSTSummary.Count);
//                 end;

//                 trigger OnAfterGetRecord()
//                 begin
//                     recGSTSummary.Get(GSTSummary.Number);
//                 end;
//             }

//             trigger OnPreDataItem()
//             begin
//                 recCompanyInfo.Get();
//                 recCompanyInfo.CalcFields(Picture);
//             end;

//             trigger OnAfterGetRecord()
//             begin
//                 recLocation.Get("Sales Header"."Location Code");
//                 txtCompanyState := '';
//                 txtCompanyCountry := '';
//                 cdCompanyStateCode := '';
//                 if recState.Get(recLocation."State Code") then begin
//                     txtCompanyState := recState.Description;
//                     cdCompanyStateCode := recState."State Code (GST Reg. No.)";
//                 end;
//                 if recCountry.Get(recLocation."Country/Region Code") then
//                     txtCompanyCountry := recCountry.Name;

//                 recCustomer.Get("Sales Header"."Bill-to Customer No.");
//                 txtCustomerCountry := '';
//                 txtCustomerState := '';
//                 cdCustomerStateCode := '';
//                 if recState.Get("Sales Header"."GST Bill-to State Code") then begin
//                     txtCustomerState := recState.Description;
//                     cdCustomerStateCode := recState."State Code (GST Reg. No.)";
//                 end;
//                 if recCountry.Get("Sales Header"."Bill-to Country/Region Code") then
//                     txtCustomerCountry := recCountry.Name;

//                 Clear(txtShipToAddress);
//                 if "Sales Header"."Ship-to Code" = '' then begin
//                     txtShipToAddress[1] := recCustomer.Name;
//                     txtShipToAddress[2] := recCustomer.Address;
//                     txtShipToAddress[3] := recCustomer."Address 2";
//                     txtShipToAddress[4] := recCustomer.City;
//                     txtShipToAddress[5] := recCustomer."Post Code";
//                     txtShipToAddress[6] := txtCustomerState;
//                     txtShipToAddress[7] := txtCustomerCountry;
//                     txtShipToAddress[8] := "Sales Header"."Customer GST Reg. No.";
//                 end;
//                 if "Sales Header"."Ship-to Code" <> '' then begin
//                     recShipToAddress.Get("Sales Header"."Sell-to Customer No.", "Sales Header"."Ship-to Code");
//                     txtShipToAddress[1] := recShipToAddress.Name;
//                     txtShipToAddress[2] := recShipToAddress.Address;
//                     txtShipToAddress[3] := recShipToAddress."Address 2";
//                     txtShipToAddress[4] := recShipToAddress.City;
//                     txtShipToAddress[5] := recShipToAddress."Post Code";

//                     if recState.Get("Sales Header"."GST Ship-to State Code") then
//                         txtShipToAddress[6] := recState.Description;
//                     if recCountry.Get(recShipToAddress."Country/Region Code") then
//                         txtShipToAddress[7] := recCountry.Name;
//                     txtShipToAddress[8] := "Sales Header"."Ship-to GST Reg. No.";
//                 end;

//                 if not recPaymentTerms.Get("Sales Header"."Payment Terms Code") then
//                     recPaymentTerms.Init();

//                 if not recShippingAgent.Get("Sales Header"."Shipping Agent Code") then
//                     recShippingAgent.Init();

//                 decTotalInvoiceValue := 0;
//                 decRoundoffAmount := 0;
//                 recSalesLines.Reset();
//                 recSalesLines.SetRange("Document No.", "Sales Header"."No.");
//                 recSalesLines.SetFilter(Quantity, '<>%1', 0);
//                 if recSalesLines.FindFirst() then
//                     repeat
//                         decDivisionFactor := recSalesLines."Qty. to Invoice" / recSalesLines.Quantity;

//                         decIGSTAmount := 0;
//                         recTaxTransactions.Reset();
//                         recTaxTransactions.SetRange("Tax Record ID", recSalesLines.RecordId);
//                         recTaxTransactions.SetRange("Tax Type", 'GST');
//                         recTaxTransactions.SetRange("Value Type", recTaxTransactions."Value Type"::COMPONENT);
//                         recTaxTransactions.SetRange("Value ID", 2);
//                         if recTaxTransactions.FindFirst() then begin
//                             decIGSTAmount := recTaxTransactions."Amount (LCY)";
//                         end;
//                         recTaxTransactions.SetRange("Value ID", 3);
//                         if recTaxTransactions.FindFirst() then begin
//                             decIGSTAmount += recTaxTransactions."Amount (LCY)";
//                         end;
//                         recTaxTransactions.SetRange("Value ID", 6);
//                         if recTaxTransactions.FindFirst() then begin
//                             decIGSTAmount += recTaxTransactions."Amount (LCY)";
//                         end;

//                         if recSalesLines."System-Created Entry" then
//                             decRoundoffAmount += recSalesLines."Line Amount";
//                         decTotalInvoiceValue += Round(recSalesLines."Line Amount" * decDivisionFactor, 0.01) +
//                                                 Round(decIGSTAmount * decDivisionFactor, 0.01);
//                     until recSalesLines.Next() = 0;

//                 cuProcess.InitTextVariable();
//                 Clear(txtAmountInWords);
//                 //cuProcess.FormatNoText(txtAmountInWords, decTotalInvoiceValue, "Sales Header"."Currency Code");

//                 if "Sales Header"."Currency Code" = '' then
//                     txtCurrencySymbol := 'Amount in ' + cuProcess.GetLocalCurrency()
//                 else
//                     txtCurrencySymbol := 'Amount in ' + "Sales Header"."Currency Code";
//             end;
//         }
//     }

//     var
//         recCompanyInfo: Record "Company Information";
//         recLocation: Record Location;
//         recState: Record State;
//         recCountry: Record "Country/Region";
//         txtCompanyState: Text[50];
//         txtCompanyCountry: Text[50];
//         txtCustomerState: Text[50];
//         txtCustomerCountry: Text[50];
//         cdCompanyStateCode: Code[2];
//         recCustomer: Record Customer;
//         recShipToAddress: Record "Ship-to Address";
//         txtShipToAddress: array[10] of Text[100];
//         recPaymentTerms: Record "Payment Terms";
//         intSrNo: Integer;
//         recGSTSummary: Record "Detailed GST Entry Buffer" temporary;
//         intEntryNo: Integer;
//         recSalesLines: Record "Sales Line";
//         decTotalInvoiceValue: Decimal;
//         decRoundoffAmount: Decimal;
//         cuProcess: Codeunit "Process Flow";
//         txtAmountInWords: array[2] of Text[80];
//         recShippingAgent: Record "Shipping Agent";
//         txtCurrencySymbol: Text[50];
//         decIGSTAmount: Decimal;
//         decLineAmount: Decimal;
//         decDivisionFactor: Decimal;
//         decIGSTPerc: Decimal;
//         decCGSTPerc: Decimal;
//         decSGSTPerc: Decimal;
//         recTaxTransactions: Record "Tax Transaction Value";
//         decGSTBaseAmount: Decimal;
//         decSGSTAmount: Decimal;
//         decCGSTAmount: Decimal;
//         cdCustomerStateCode: Code[10];
// }