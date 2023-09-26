page 50116 EnrolmentPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EnrolmentTableArash;
    Caption = 'Enrolment Page Arash';
    CardPageId = EnrolmentCardArash;

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
                    begin
                        CourseTable.Reset();
                        if Page.RunModal(Page::CoursePageArash, CourseTable) = Action::LookupOK then begin
                            Text := CourseTable.ID;
                            exit(true)
                        end;
                    end;

                    // trigger OnValidate()
                    // begin
                    //     if (getResultDepartment()) then
                    //         Message('Added') else
                    //         Error('This Course is not in The department The student stuying in');
                    // end;
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
                        if (getResultStudent()) then
                            Message('Added') else
                            Error('The department of this student does not have the pervoius course');
                    end;
                }
            }
        }
    }

    // procedure getResultDepartment(): Boolean
    // begin
    //     if StudentTable.Department = CoursePlan.DepartmentID then
    //         exit(true) else
    //         exit(false);
    // end;

    procedure getResultStudent(): Boolean
    begin
        if rec.CourseID = CoursePlan.CourseID then
            Message(rec.CourseID);
        if CoursePlan.DepartmentID = rec.StudentId then
            exit(true) else
            exit(false);
    end;

    var
        StudentTable: Record StudentTableArash;
        CourseTable: Record CourseTableArash;
        CoursePlan: Record CoursePlanTableArash;
}