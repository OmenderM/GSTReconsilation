query 50010 "Purchase Invoice"
{
    elements
    {
        dataitem(Purch__Inv__Header; "Purch. Inv. Header")
        {
            column(No_; "No.") { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Due_Date; "Due Date") { }
            column(Location_Code; "Location Code") { }

            dataitem(Purch__Inv__Line; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = Purch__Inv__Header."No.";

                column(Type; Type) { }
                column(ItemNo; "No.") { }
                column(Quantity; Quantity) { }
                column(Unit_Price__LCY_; "Unit Price (LCY)") { }
                column(Line_Amount; "Line Amount") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Job_Line_Amount__LCY_; "Job Line Amount (LCY)") { }




            }
        }
    }


    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}