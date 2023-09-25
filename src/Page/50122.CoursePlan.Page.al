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
                        Message(CourseID);
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
                        Message(DepartmentID);
                    end;
                }
            }
        }
    }



    var
        CourseID: Code[20];
        DepartmentID: Code[20];
}