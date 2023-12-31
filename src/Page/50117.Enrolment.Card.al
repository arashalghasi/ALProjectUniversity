page 50117 EnrolmentCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EnrolmentTableArash;
    Caption = 'Enrolment Card';

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
                field(CourseID; Rec.CourseID)
                {
                    ApplicationArea = All;
                    Caption = 'Course ID';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CourseTable.Reset();
                        if Page.RunModal(Page::CoursePageArash, CourseTable) = Action::LookupOK then begin
                            Text := CourseTable.ID;
                            exit(true)
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if rec.StudentId <> '' then
                            if (GetStudentid()) then
                                Message('Added') else
                                Error('This student does not study in This department ');
                    end;
                }

                field(CourseName; Rec.CourseName)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }

                field(StudentId; Rec.StudentId)
                {
                    ApplicationArea = All;
                    Caption = 'Student ID';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        StudentTable.Reset();
                        if Page.RunModal(Page::StudentPageArash, StudentTable) = Action::LookupOK then begin
                            Text := StudentTable.ID;
                            exit(true)
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if rec.CourseID <> '' then
                            if (GetDepartmentid()) then
                                Message('Added') else
                                Error('The department of this student does not have the pervoius course');
                    end;
                }


                field(studentName; Rec.studentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student last Name';
                }
            }
        }
    }

    procedure GetStudentid(): Boolean
    var
        depId: List of [Code[20]];
        depIdStu: Code[20];
    begin
        StudentTable.Reset();
        CourseTable.Reset();
        CoursePlan.Reset();
        StudentTable.SetRange(StudentTable.ID, rec.StudentId);
        if StudentTable.FindFirst() then begin
            depIdStu := StudentTable.Department;
            CoursePlan.SetRange(CoursePlan.CourseID, rec.CourseID);
            if CoursePlan.FindSet() then begin
                REPEAT
                    depId.Add(CoursePlan.DepartmentID);
                UNTIL CoursePlan.NEXT = 0;
                if depId.Contains(depIdStu) then
                    exit(true) else
                    exit(false);
            end;
        end;
    end;

    procedure GetDepartmentid(): Boolean
    var
        depId: List of [Code[20]];
        depIdStu: Code[20];
    begin
        StudentTable.Reset();
        CourseTable.Reset();
        CoursePlan.Reset();
        CoursePlan.SetRange(CoursePlan.CourseID, rec.CourseID);
        if CoursePlan.FindSet() then begin
            REPEAT
                depId.Add(CoursePlan.DepartmentID)
UNTIL CoursePlan.NEXT = 0;
            StudentTable.SetRange(StudentTable.ID, rec.StudentId);
            if StudentTable.FindFirst() then begin
                depIdStu := StudentTable.Department;
                if depId.Contains(depIdStu) then
                    exit(true) else
                    exit(false);
            end;
        end;
    end;


    var
        StudentTable: Record StudentTableArash;
        CourseTable: Record CourseTableArash;
        CoursePlan: Record CoursePlanTableArash;
}
