page 50121 GradeCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = GradeTableArash;
    Caption = 'Grade Card Arash';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; rec.ID)
                {
                    ApplicationArea = All;
                    Caption = 'ID';
                }
                field(StudentId; rec.StudentId)
                {
                    ApplicationArea = All;
                    Caption = 'Student ID';
                }
                field(ExamId; Rec.ExamId)
                {
                    ApplicationArea = All;
                    Caption = 'Exam ID';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    Caption = 'Score';
                }
            }
        }
    }
}