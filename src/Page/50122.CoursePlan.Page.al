page 50122 CoursePlanPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CoursePlanTableArash;
    Caption = 'CoursePlan Page';
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

                field(courseName; Rec.courseName)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }

                field(DepartmentID; Rec.DepartmentID)
                {
                    ApplicationArea = All;
                    Caption = 'Department ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        DepartmentTable: Record DepartmentTableArash;
                    begin
                        DepartmentTable.Reset();
                        if Page.RunModal(Page::DepartmentPageArash, DepartmentTable) = Action::LookupOK then begin
                            Text := DepartmentTable.ID;
                            exit(true);
                        end;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;



    var
        CourseID: Code[20];
        DepartmentID: Code[20];
}