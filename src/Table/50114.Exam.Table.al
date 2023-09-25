table 50114 ExamTableArash
{
    Caption = 'Exam Table Arash';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(10; CourseID; Code[20])
        {
            Caption = 'Course ID';
            TableRelation = CourseTableArash.ID;
        }
        field(20; ExamDate; Date)
        {
            Caption = 'Exam Date';
        }
        field(40; Maximum; Integer)
        {
            Caption = 'Maximum';
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
            NoSerieManagement.InitSeries('EXAMARASH', xRec."No Series", 0D, ID, "No Series");

        end;
    end;
}
