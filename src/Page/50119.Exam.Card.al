page 50119 ExamCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ExamTableArash;
    Caption = 'Exam Card';

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

                field(CourseName; Rec.CourseName)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }
                field(ExamDate; Rec.ExamDate)
                {
                    ApplicationArea = All;
                    Caption = 'Exam Date';
                }
                field(Maximum; Rec.Maximum)
                {
                    ApplicationArea = All;
                    Caption = 'Maximum score';
                }
            }
        }
    }
}