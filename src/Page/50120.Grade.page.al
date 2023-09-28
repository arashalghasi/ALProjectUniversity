page 50120 GradePageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = GradeTableArash;
    Caption = 'Grade Page';
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


                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
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
                            IF (getResult()) THEN begin
                                Text := ExamTable.ID;
                                exit(true)
                            end else
                                Error('The Student does not habe this Course choose another');
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if getResult() then
                            Message('Added') else
                            Error('The Student does not have to course to be able to do the exam');
                    end;
                }

                field(ExamDate; Rec.ExamDate)
                {
                    ApplicationArea = All;
                    Caption = 'Exam Date';
                }

                field(CourseID; Rec.CourseID)
                {
                    ApplicationArea = All;
                    Caption = 'Course ID';
                }

                field(CourseName; Rec.CourseName)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }

                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    Caption = 'Score';

                    trigger OnValidate()
                    begin
                        if checkScore() then
                            Message('Added') else
                            Error('The Score is more than the maximum');
                    end;
                }

                field(Acceptance; Rec.Acceptance)
                {
                    ApplicationArea = All;
                    Caption = 'Acceptance';
                }


            }
        }
    }
    procedure getResult(): Boolean
    var
        CourseIdExam: Code[20];
        CousrIdStu: list of [Code[20]];
        element: Code[20];
        Ele: Code[20];
        bool: Boolean;
    begin
        bool := false;
        EnrolmentTable.Reset();
        ExamTable.Reset();
        EnrolmentTable.SetRange(EnrolmentTable.StudentId, Rec.StudentId);
        if EnrolmentTable.FindSet() then begin
            REPEAT
                CousrIdStu.Add(EnrolmentTable.CourseId);
            UNTIL EnrolmentTable.NEXT = 0;
            ExamTable.SetRange(ExamTable.ID, rec.ExamId);
            if ExamTable.FindFirst() then begin
                CourseIdExam := ExamTable.CourseID;
                foreach element in CousrIdStu do begin
                    if element = CourseIdExam then
                        bool := true;
                end;
                if bool then begin
                    exit(true);
                end else begin
                    exit(false);
                end;
            end;
        end;
    end;


    procedure CheckScore(): Boolean
    var
        maxScore: Integer;
    begin
        ExamTable.Reset();
        ExamTable.SetRange(ExamTable.ID, Rec.ExamId);
        if ExamTable.FindFirst() then
            maxScore := ExamTable.Maximum;
        if (Rec.Score <= maxScore) then
            exit(true)
        else
            exit(false);
    end;

    var
        EnrolmentTable: Record EnrolmentTableArash;
        ExamTable: Record ExamTableArash;
}