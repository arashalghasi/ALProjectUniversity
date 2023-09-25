page 50115 CourseCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CourseTableArash;
    Caption = 'Course Card Arash';

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
                field(CourseName; rec.CourseName)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }
                field(Credits; Rec.Credits)
                {
                    ApplicationArea = All;
                    Caption = 'Credits';
                }
            }
        }
    }
}