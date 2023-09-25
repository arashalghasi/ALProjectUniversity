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
                field(CourseID; CourseID)
                {
                    ApplicationArea = All;
                    Caption = 'Course ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CourseTable: Record CourseTableArash;
                    begin
                        CourseTable.Reset();
                        if Page.RunModal(Page::CoursePageArash, CourseTable) = Action::LookupOK then
                            CourseID := CourseTable.ID;
                    end;
                }
                field(DepartmentID; DepartmentID)
                {
                    ApplicationArea = All;
                    Caption = 'Department ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        DepartmentTable: Record DepartmentTableArash;
                    begin
                        DepartmentTable.Reset();
                        if Page.RunModal(Page::DepartmentPageArash, DepartmentTable) = Action::LookupOK then
                            DepartmentID := DepartmentTable.ID;
                    end;
                }
            }
        }
    }


    var
        CourseID: Code[20];
        DepartmentID: Code[20];
}