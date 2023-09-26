table 50113 EnrolmentTableArash
{
    Caption = 'Enrolment Table Arash';
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
        field(20; StudentId; Code[20])
        {
            Caption = 'Student Id';
            TableRelation = StudentTableArash.ID;
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

        key(SK; CourseID, StudentId)
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    var
        NoSerieManagement: Codeunit NoSeriesManagement;
    begin
        if ("No Series" = '') then begin
            NoSerieManagement.InitSeries('ENROLARASH', xRec."No Series", 0D, ID, "No Series");

        end;
    end;
}
