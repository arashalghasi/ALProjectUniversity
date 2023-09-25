page 50119 ExamCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ExamTableArash;
    Caption = 'Exam Card Arash';

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
                field(CourseID; rec.CourseID)
                {
                    ApplicationArea = All;
                    Caption = 'Course ID';
                }
                field(ExamDate; Rec.ExamDate)
                {
                    ApplicationArea = All;
                    Caption = 'Exam Date';
                }
                field(Maximum; Rec.Maximum)
                {
                    ApplicationArea = All;
                    Caption = 'Maximum score';
                }
            }
        }
    }
}