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
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CourseTable: Record CourseTableArash;
                    begin
                        CourseTable.Reset();
                        if Page.RunModal(Page::CoursePageArash, CourseTable) = Action::LookupOK then begin
                            Text := CourseTable.ID;
                            exit(true);
                        end;
                    end;
                }

                field(CourseName; Rec.CourseName)
                {
                    ToolTip = 'Specifies the value of the Name Movie field.';
                    Caption = 'Course Name';
                }

            }
        }
    }
}