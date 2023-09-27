table 50115 GradeTableArash
{
    Caption = 'Grade Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(10; StudentId; Code[20])
        {
            Caption = 'Student ID';
            TableRelation = StudentTableArash.ID;
        }
        field(20; ExamId; Code[20])
        {
            Caption = 'Exam Date';
            TableRelation = ExamTableArash.ID;
        }
        field(40; Score; Integer)
        {
            Caption = 'Score';
        }
        field(50; Acceptance; Boolean)
        {
            Caption = 'Acceptance';
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
            NoSerieManagement.InitSeries('GRADEARASH', xRec."No Series", 0D, ID, "No Series");

        end;
    end;
}
