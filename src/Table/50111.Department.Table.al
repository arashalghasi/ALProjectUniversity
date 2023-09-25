table 50111 DepartmentTableArash
{
    Caption = 'Department Table Arash';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(10; DepartmentName; Text[100])
        {
            Caption = 'Department Name Nme';
        }

        field(30; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No Series';
            TableRelation = "No. Series";
            Editable = false;
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSerieManagement: Codeunit NoSeriesManagement;
    begin
        if ("No Series" = '') then begin
            NoSerieManagement.InitSeries('DEPARTARASH', xRec."No Series", 0D, ID, "No Series");
        end;
    end;
}
