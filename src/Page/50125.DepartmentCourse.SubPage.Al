page 50125 DepartmentCourseSubpageArash
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = CoursePlanTableArash;
    Caption = 'All the courses of the Department';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CourseID; Rec.CourseID)
                {
                    ToolTip = 'Specifies the value of the ID Movie field.';
                    Caption = 'Course ID';
                }
            }
        }
    }
}