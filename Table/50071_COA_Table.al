table 50071 "G/L Account Test"
{
    Caption = 'G/L Account Card';
    DataClassification = ToBeClassified;

    fields
    {
        field(5000; "No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Income/Balance"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Income Statement","Balance Sheet";
            Caption = 'Income/Balance';

            trigger OnValidate()
            Var
                CostType: Record "Cost Type";
            Begin
                if ("Income/Balance" = "Income/Balance"::"Balance Sheet") and ("No" <> '') then begin
                    if CostType.Get("No") then begin
                        CostType."G/L Account Range" := '';
                        CostType.Modify();
                    end;
                    "No" := ''
                end;
            End;

        }
        // field(50003; "Account Category"; Enum "G/L Account Category")
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Account Category';

        // }
        field(50004; "Debit/Credit"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Both","Debit","Credit";
            Caption = 'Debit/Credit';
            OptionCaption = 'Both,Debit,Credit';
        }
        field(50005; "Account Type"; Enum "G/L Account Type")
        {
            Caption = 'Account Type';
            trigger OnValidate()
            Var
                GLEntry: Record "G/L Entry";
                GLBudgetEntry: Record "G/L Budget Entry";
            begin
                // Case "Account Type" of
                //     "Account Type"::Posting:
                //     "API Account Type" := "API Account Type"::Posting;
                //     "Account Type"::Heading:
                //     "API Account Type":= "API Account Type"::Heading;
                //     "Account Type"::Total:
                //     "API Account Type":= "API Account Type"::Total;
                //     "Account Type"::"Begin-Total":
                //     "API Account Type":= "API Account Type"::"Begin-Total";
                //     "Account Type"::"End-Total":
                //     "API Account Type":= "API Account Type"::"End-Total";
                // End;
            end;
        }
        // field(50006;Totaling; Text[300])
        // {
        //     trigger OnValidate()
        //     begin
        //         if not IsTotaling() then
        //         FieldError("Account Type");
        //         CalcFields(Balance)
        //     end;
        // }
        field(50007; Balance; Decimal)
        {

        }

        field(50111; "API Account Type"; Enum "G/L Account Type")
        {
            Caption = 'API Account Type';
            Editable = false;
        }
    }

    keys
    {
        // key(Key1; MyField)
        // {
        //     Clustered = true;
        // }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}