page 50114 CoursePageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CourseTableArash;
    Caption = 'Course Page Arash';
    CardPageId = CourseCardArash;

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

                field(CourseName; Rec.CourseName)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }

                field(Credits; Rec.Credits)
                {
                    ApplicationArea = All;
                    Caption = 'Credits';
                }
            }
        }
    }
}