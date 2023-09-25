page 50113 DepartmentCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DepartmentTableArash;
    Caption = 'Department Card Arash';

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
                field(DepartmentName; rec.DepartmentName)
                {
                    ApplicationArea = All;
                    Caption = 'Department Name';
                }


                field(NumberOfCourses; Rec."Number of Courses")
                {
                    ApplicationArea = All;
                    Caption = 'Number Of Courses';
                }

                field(NumberOfStudents; Rec."Number of Students")
                {
                    ApplicationArea = All;
                    Caption = 'Number Of Students';
                }
            }

            part("All The Courses"; DepartmentCourseSubpageArash)
            {
                SubPageLink = DepartmentID = field("ID");
                UpdatePropagation = Both;
            }
        }
    }
}