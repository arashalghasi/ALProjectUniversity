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
                }

                field(StudentId; Rec.StudentId)
                {
                    ApplicationArea = All;
                    Caption = 'Student Id';
                }
            }
        }
    }
}