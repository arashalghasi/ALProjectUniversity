table 50116 CoursePlanTableArash
{
    Caption = 'Course Plan Table Arash';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'ID';
        }
        field(10; CourseID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course ID';
            TableRelation = CourseTableArash.ID;
        }

        field(20; DepartmentID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department ID';
            TableRelation = DepartmentTableArash.ID;
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

        key(SK; CourseID, DepartmentID)
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    var
        NoSerieManagement: Codeunit NoSeriesManagement;
    begin
        if ("No Series" = '') then begin
            NoSerieManagement.InitSeries('COUPLANARASH', xRec."No Series", 0D, ID, "No Series");

        end;
    end;
}
