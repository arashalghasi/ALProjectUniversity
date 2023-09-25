page 50122 CoursePlanPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CoursePlanTableArash;
    Caption = 'CoursePlan Page Arash';
    CardPageId = CoursePlanCardArash;

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

                field(DepartmentID; Rec.DepartmentID)
                {
                    ApplicationArea = All;
                    Caption = 'Department ID';
                }
            }
        }
    }
}