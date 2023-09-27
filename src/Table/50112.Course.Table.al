table 50112 CourseTableArash
{
    Caption = 'Course Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(10; CourseName; Text[100])
        {
            Caption = 'Course Name';
        }
        field(20; Credits; Integer)
        {
            Caption = 'Credits';
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
            NoSerieManagement.InitSeries('COURSEARASH', xRec."No Series", 0D, ID, "No Series");

        end;
    end;
}
