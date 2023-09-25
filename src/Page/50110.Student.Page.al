page 50110 StudentPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = StudentTableArash;
    Caption = 'Student Page Arash';
    CardPageId = StudentCardArash;

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
                field(FirstName; Rec.FirstName)
                {
                    ToolTip = 'Specifies the value of the FirstName field.';
                    Caption = 'First Name';
                }
                field(LastName; Rec.LastName)
                {
                    Caption = 'Last Name';
                }
                field(Department; Rec.Department)
                {
                    Caption = 'Department';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        DepartMentTable: Record DepartmentTableArash;
                    begin
                        DepartMentTable.Reset();
                        if Page.RunModal(Page::DepartmentPageArash, DepartMentTable) = Action::LookupOK then begin
                            Text := DepartMentTable.ID;
                            exit(true);
                        end;
                    end;
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
        }
    }
}