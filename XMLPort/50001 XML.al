xmlport 50001 MyXmlport
{
    Caption = 'Customer Data Import';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = WINDOWS;
    schema
    {
        textelement(CustomerImport)
        {
            tableelement("CustomerTable"; CustomerTable)
            {
                AutoSave = false;

                textelement(CustomerId)
                {
                    MinOccurs = zero;

                }

                textelement(CustomerName)
                {
                    MinOccurs = zero;
                }


                textelement(CustomerType)
                {
                    MinOccurs = zero;
                }
                ///Inserting the data through CSV file///
                // trigger OnAfterInsertRecord()
                // begin

                //     intcounter += 1;
                //     if (intcounter > 1) then begin
                //         if cdcode <> CustomerId then begin
                //             recCustomer.Reset();
                //             recCustomer.SetRange("Customer Id", CustomerId);
                //             recCustomer.Init();
                //             recCustomer."Customer Id" := CustomerId;
                //             recCustomer."Customer Name" := CustomerName;
                //             recCustomer."Customer Type " := CustomerType;
                //             recCustomer.Insert();

                //         end;
                //     end;

                // end;

                ///Inserting the data through CSV file///

                ///Modify Data through CSV File///

                // trigger OnAfterInsertRecord()
                // begin
                //     intcounter += 1;
                //     if (intcounter > 1) then begin
                //         if cdcode <> CustomerId then begin

                //             recCustomer.Reset();
                //             recCustomer.SetRange("Customer Id", CustomerId);
                //             recCustomer.FindFirst();
                //             recCustomer."Customer Name" := CustomerName;
                //             recCustomer."Customer Type " := CustomerType;
                //             recCustomer.Modify();
                //         end;

                //     end;
                // end;

                ///Modify Data through CSV File///


                ///Inserting and modify at the same time data through CSV file///


                trigger OnAfterInsertRecord()
                begin
                    intcounter += 1;
                    if (intcounter > 1) and (CustomerId <> '') then begin

                        recCustomer.Reset();
                        recCustomer.SetRange(recCustomer."Customer Id", CustomerId);
                        if not recCustomer.FindFirst() then begin
                            recCustomer.Init();
                            recCustomer."Customer Id" := CustomerId;
                            recCustomer."Customer Name" := CustomerName;
                            recCustomer."Customer Type " := CustomerType;
                            recCustomer.Insert();
                        end else begin
                            recCustomer."Customer Name" := CustomerName;
                            recCustomer."Customer Type " := CustomerType;
                            recCustomer.Modify();
                        end;
                    end;
                end;

                ///Inserting and modify at the same time data through CSV file///


                // trigger OnAfterInsertRecord()
                // begin
                //     intcounter += 1;
                //     if (intcounter > 1) and (CustomerId <> '') then begin

                //         recCustomer.Reset();
                //         recCustomer.SetRange("Customer Id", CustomerId);
                //         recCustomer.Init();
                //         recCustomer."Customer Name" := CustomerName;
                //         recCustomer."Customer Type " := CustomerType;
                //         recCustomer.Delete();
                //     end;
                // end;
            }
        }

    }


    trigger OnPostXmlPort();
    begin
        Message('Data Import Succesfully');
    end;

    var
        intcounter: Integer;
        intLineno: Integer;
        recCustomer: Record "CustomerTable";
        intNo: Integer;
        cdcode: Code[10];



}