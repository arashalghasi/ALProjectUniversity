page 50112 DepartmentPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = DepartmentTableArash;
    Caption = 'DepartmentPage Arash';
    CardPageId = DepartmentCardArash;

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

                field(FacultyName; Rec.DepartmentName)
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
        }
    }
}