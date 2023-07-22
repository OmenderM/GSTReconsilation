xmlport 50003 VendorImort
{
    Caption = 'Vendor Import';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(VendorImport)
        {
            MinOccurs = Zero;
            tableelement("Vendor"; Vendor)
            {
                AutoReplace = false;
                XmlName = 'VendorImport';

                textelement(Entity)
                {
                    MinOccurs = Zero;
                }

                textelement(Noseriescode)
                {
                    MinOccurs = Zero;
                }

                textelement(No2)
                {
                    MinOccurs = Zero;
                }

                textelement(WealCode)
                {
                    MinOccurs = Zero;
                }

                textelement(Name)
                {
                    MinOccurs = Zero;
                }

                textelement(PANNo)
                {
                    MinOccurs = Zero;
                }

                textelement(Address)
                {
                    MinOccurs = Zero;
                }

                textelement(Add2)
                {
                    MinOccurs = Zero;
                }

                textelement(City)
                {
                    MinOccurs = Zero;
                }

                textelement(PostCode)
                {
                    MinOccurs = Zero;
                }

                textelement(CountryRegCode)
                {
                    MinOccurs = Zero;
                }

                textelement(PhoneNo)
                {
                    MinOccurs = Zero;
                }

                textelement(state)
                {
                    MinOccurs = Zero;
                }

                textelement(Appmethod)
                {
                    MinOccurs = Zero;
                }

                textelement(Email)
                {
                    MinOccurs = Zero;
                }

                textelement(Blocked)
                {
                    MinOccurs = Zero;
                }

                textelement(GenBusPGrp)
                {
                    MinOccurs = Zero;
                }

                textelement(VendPstGrp)
                {
                    MinOccurs = Zero;
                }


                textelement(MSMEType)
                {
                    MinOccurs = Zero;
                }


                textelement(SkinDuplicatePAN)
                {
                    MinOccurs = Zero;
                }


                textelement(GSTRegNo)
                {
                    MinOccurs = Zero;
                }


                textelement(preferredBankaccode)
                {
                    MinOccurs = Zero;
                }


                textelement(VendorBank)
                {
                    MinOccurs = Zero;
                }

                textelement(VendorBankBr)
                {
                    MinOccurs = Zero;
                }


                textelement(VendorBankaccount)
                {
                    MinOccurs = Zero;
                }


                textelement(VendorIFSCcode)
                {
                    MinOccurs = Zero;
                }


                textelement(AssesseCode)
                {
                    MinOccurs = Zero;
                }

                textelement(AllowedSection)
                {
                    MinOccurs = Zero;
                }

                trigger OnAfterInsertRecord()
                begin
                    Intcounter += 1;
                    if (Intcounter > 1) and (Name <> '') then begin

                        recVendor.Init();
                        recVendor."No." := Noseriescode;
                        recVendor.Insert(true);

                        // recVendor.Reset();
                        // recVendor.SetRange("No.", cdcode);
                        // recVendor.FindFirst();
                        // recVendor."No. 2" := No2;
                        // recVendor."Wealth Maker Code" := WealCode;
                        // recVendor.Name := Name;
                        // recVendor."AAN No." := PANNo;
                        // recVendor.Address := Address;
                        // recVendor."Address 2" := Add2;
                        // recVendor.City := City;
                        // recVendor."Post Code" := PostCode;
                        // recVendor."Country/Region Code" := CountryRegCode;
                        // recVendor."Phone No." := PhoneNo;
                        // recVendor.Sta := state;
                        // recVendor."Application Method" := Appmethod;
                        // recVendor."E-Mail" := Email;
                        // recVendor.Blocked := Blocked;
                        // recVendor."Gen. Bus. Posting Group" := GenBusPGrp;
                        // recVendor."Vendor Posting Group" := VendPstGrp;
                        // recVendor."MSME Type" := MSMEType;
                        // recVendor."Skip Duplicate PAN No." := SkinDuplicatePAN;
                        // recVendor.G := GSTRegNo;
                        recVendor."Preferred Bank Account Code" := preferredBankaccode;
                        // recVendor.ven :=VendorBank;
                        // recVendor.vendorBankBr :=VendorBankBr;
                        //recVendor.VendBankAcc :=VendorBankaccount;
                        //recVendor. :=VendorIFSCcode;
                        // recVendor.AssesseCode :=AssesseCode;
                        // recVendor. :=AllowedSection;
                        recVendor.Modify(true);




                    end;
                end;

                // fieldattribute(NodeName3; NodeName2.SourceFieldName)
                // {

                // }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        Message('Data Import Successfully ');
    end;

    var
        recVendor: Record Vendor;
        Intcounter: Integer;
        cdcode: Code[20];

}