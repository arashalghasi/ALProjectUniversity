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
                    ToolTip = 'Specifies the value of the Last Name field.';
                    Caption = 'Last Name';
                }
                field(FullName; FullNameCal())
                {
                    Caption = 'Full Name';
                    Editable = false;
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
                field(DepartmentName; Rec.DepartmentName)
                {
                    Caption = 'Department Name';
                }
                field(NumberOfCourses; Rec."Number of Courses")
                {
                    Caption = 'Number Of Courses';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Caption = 'Date of Birth';
                }
                field(Email; Rec.Email)
                {
                    Caption = 'Email';
                }
                field(Phone; Rec.Phone)
                {
                    Caption = 'Phone';
                }
                field(Gender; Rec.Gender)
                {
                    Caption = 'Gender';
                }
            }

            part("All The Courses"; StudentCourseSubpageArash)
            {
                SubPageLink = StudentId = field("ID");
                UpdatePropagation = Both;
            }
        }
    }

    procedure FullNameCal(): Text
    var
        StudentTable: Record StudentTableArash;
        Gender: Enum GenderArash;
        FullName: Text[100];
    begin
        StudentTable.Reset();

        if (StudentTable.Find('-')) then begin
            REPEAT
                if (StudentTable.ID = rec.ID) then begin

                    if StudentTable.Gender = Gender::Man then begin
                        FullName := 'Mr. ' + rec.FirstName + ' ' + rec.LastName;
                        exit(FullName);
                    end;
                    if StudentTable.Gender = Gender::Woman then begin
                        FullName := 'Mrs. ' + rec.FirstName + ' ' + rec.LastName;
                        exit(FullName);
                    end;
                    if StudentTable.Gender = Gender::Other then begin
                        FullName := 'X. ' + rec.FirstName + ' ' + rec.LastName;
                        exit(FullName);
                    end;
                end;
            UNTIL StudentTable.NEXT = 0;
        end;
    end;
}