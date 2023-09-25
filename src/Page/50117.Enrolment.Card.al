page 50117 EnrolmentCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EnrolmentTableArash;
    Caption = 'Enrolment Card Arash';

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
                field(Credits; Rec.StudentId)
                {
                    ApplicationArea = All;
                    Caption = 'Student Id';
                }
            }
        }
    }
}