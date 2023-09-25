page 50123 CoursePlanCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CoursePlanTableArash;
    Caption = 'Course Plan Card Arash';

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
                field(DepartmentID; Rec.DepartmentID)
                {
                    ApplicationArea = All;
                    Caption = 'Department ID';
                }
            }
        }
    }
}