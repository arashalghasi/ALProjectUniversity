page 50128 StudentExamSubpageArash
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = GradeTableArash;
    Caption = 'All the Exam of the Student';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(StudentID; Rec.StudentId)
                {
                    ToolTip = 'Specifies the value of the ID Movie field.';
                    Caption = 'Student ID';
                }
                field(ExamID; Rec.ExamId)
                {
                    ToolTip = 'Specifies the value of the ID Movie field.';
                    Caption = 'Exam ID';
                }

                field(ExamDate; Rec.ExamDate)
                {
                    ToolTip = 'Specifies the value of the Name Movie field.';
                    Caption = 'Course Date';
                }

                field(CourseID; Rec.CourseID)
                {
                    Caption = 'Course ID';
                }

                field(CourseName; Rec.CourseName)
                {
                    Caption = 'Course Name';
                }

                field(ExamScore; Rec.Score)
                {
                    ToolTip = 'Specifies the value of the Name Movie field.';
                    Caption = 'Exam Score';
                }
            }


        }
    }

}

