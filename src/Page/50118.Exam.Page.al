page 50118 ExamPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ExamTableArash;
    Caption = 'Exam Page Arash';
    CardPageId = ExamCardArash;

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

                field(CourseID; Rec.CourseID)
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