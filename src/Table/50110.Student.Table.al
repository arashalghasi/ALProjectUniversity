table 50110 StudentTableArash
{
    Caption = 'Student Table Arash';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(10; FirstName; Text[100])
        {
            Caption = 'First Name';
        }
        field(20; LastName; Text[100])
        {
            Caption = 'Last Name';
        }
        field(30; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(40; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(50; Phone; Code[20])
        {
            Caption = 'Phone';
        }
        field(70; "No Series"; Code[20])
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
            NoSerieManagement.InitSeries('STUARASH', xRec."No Series", 0D, ID, "No Series");
        end;
    end;
}
