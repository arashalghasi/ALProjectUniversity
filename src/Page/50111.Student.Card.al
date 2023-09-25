page 50111 StudentCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentTableArash;

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
                field(FirstName; Rec.FirstName)
                {
                    ToolTip = 'Specifies the value of the FirstName field.';
                    Caption = 'First Name';
                }
                field(LastName; Rec.LastName)
                {
                    ToolTip = 'Specifies the value of the LastName field.';
                    Caption = 'Last Name';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the LastName field.';
                    Caption = 'Department';
                }
                field(NumberOfCourses; Rec."Number of Courses")
                {
                    Caption = 'Number Of Courses';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                    Caption = 'Date of Birth';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                    Caption = 'Email';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                    Caption = 'Phone';
                }
            }

            part("All The Courses"; StudentCourseSubpageArash)
            {
                SubPageLink = StudentId = field("ID");
                UpdatePropagation = Both;
            }
        }
    }
}