codeunit 50005 "First Process"
{
    TableNo = CustomerTable;

    trigger OnRun()
    begin
        CheckCustomer(Rec);
    end;

    procedure CheckCustomer(Var cus: Record CustomerTable)
    begin
        if (cus."Customer Id" = '') then
            Error('Customer does not exist');
    end;

    var
        myInt: Integer;

}