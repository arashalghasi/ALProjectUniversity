page 50124 StudentCourseSubpageArash
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = EnrolmentTableArash;
    Caption = 'All the courses of the Student';

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