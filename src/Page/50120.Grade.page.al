page 50120 GradePageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = GradeTableArash;
    Caption = 'Grade Page Arash';
    CardPageId = GradeCardArash;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; rec.ID)
                {
                    ApplicationArea = All;
                    Caption = 'ID';

                }

                field(StudentId; Rec.StudentId)
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