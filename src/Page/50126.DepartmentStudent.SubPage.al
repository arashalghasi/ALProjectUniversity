page 50126 DepartmentStudentSubpageArash
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = StudentTableArash;
    Caption = 'All the courses of the Department';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(StudentId; Rec.ID)
                {
                    ApplicationArea = All;
                    Caption = 'Student ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        StudentTable: Record StudentTableArash;
                    begin
                        StudentTable.Reset();
                        if Page.RunModal(Page::StudentPageArash, StudentTable) = Action::LookupOK then begin
                            Text := StudentTable.ID;
                            exit(true);
                        end;
                    end;
                }
            }
        }
    }
}