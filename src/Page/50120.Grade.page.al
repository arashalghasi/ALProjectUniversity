page 50120 GradePageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = GradeTableArash;
    Caption = 'Grade Page Arash';
    CardPageId = GradeCardArash;

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

                field(StudentId; Rec.StudentId)
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

                field(ExamId; Rec.ExamId)
                {
                    ApplicationArea = All;
                    Caption = 'Exam ID';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ExamTable: Record ExamTableArash;
                    begin
                        ExamTable.Reset();
                        if Page.RunModal(Page::ExamPageArash, ExamTable) = Action::LookupOK then begin
                            Text := ExamTable.ID;
                            exit(true);
                        end;
                    end;
                }

                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    Caption = 'Score';
                }

                field(Acceptance; Rec.Acceptance)
                {
                    ApplicationArea = All;
                    Caption = 'Acceptance';
                }


            }
        }
    }
}