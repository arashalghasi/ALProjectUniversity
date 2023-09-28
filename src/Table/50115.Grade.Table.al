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
        field(15; StudentName; Text[100])
        {
            FieldClass = FlowField;
            Caption = 'Student Name';
            CalcFormula = lookup(StudentTableArash.LastName where(ID = field(StudentId)));
        }
        field(20; ExamId; Code[20])
        {
            Caption = 'Exam Date';
            TableRelation = ExamTableArash.ID;
        }
        field(25; ExamDate; Date)
        {
            FieldClass = FlowField;
            Caption = 'Exam Date';
            CalcFormula = lookup(ExamTableArash.ExamDate where(ID = field(ExamId)));
        }

        field(26; CourseID; Code[20])
        {
            FieldClass = FlowField;
            Caption = 'Course ID';
            CalcFormula = lookup(ExamTableArash.CourseID where(ID = field(ExamId)));
        }

        field(27; CourseName; Text[100])
        {
            FieldClass = FlowField;
            Caption = 'Exam Course';
            CalcFormula = lookup(ExamTableArash.CourseName where(ID = field(ExamId)));
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
        key(SK; StudentId, ExamId)
        {
            Clustered = false;
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
