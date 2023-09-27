page 50110 StudentPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = StudentTableArash;
    Caption = 'Student Page Arash';
    CardPageId = StudentCardArash;

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
                field(FirstName; Rec.FirstName)
                {
                    ToolTip = 'Specifies the value of the FirstName field.';
                    Caption = 'First Name';
                }
                field(LastName; Rec.LastName)
                {
                    Caption = 'Last Name';
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
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                    Caption = 'Date of Birth';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                    Caption = 'Email';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                    Caption = 'Phone';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpperCase)
            {
                Caption = 'Make the last Name Upper Case';
                trigger OnAction()
                var
                    StudentTable: Record StudentTableArash;
                begin
                    StudentTable.Reset();
                    if StudentTable.Find('-') then begin
                        repeat
                            StudentTable.LastName := StudentTable.LastName.ToUpper();
                            StudentTable.Modify(true);
                        //Message(Format(aa.Count()));
                        //Message('Hello');
                        until StudentTable.Next = 0;
                    end;
                end;
            }
            action(LowerCase)
            {
                Caption = 'Make the last Name Lower Case';
                trigger OnAction()
                var
                    StudentTable: Record StudentTableArash;
                begin
                    StudentTable.Reset();
                    if StudentTable.Find('-') then begin
                        repeat
                            StudentTable.LastName := StudentTable.LastName.ToLower();
                            StudentTable.Modify();
                        until StudentTable.Next = 0;
                    end;
                end;
            }
        }

        area(Creation)
        {
            Description = 'this is a Description';
            action(helloFromAction)
            {
                Caption = 'Hello From Action';
                trigger OnAction()
                begin
                    Message('Hello!');
                end;
            }
        }

        area(Navigation)
        {
            group(subGroup1)
            {
                action(helloFromsubGroup11)
                {
                    Caption = 'hello From subGroup 11';
                    trigger OnAction()
                    begin
                        Message('Hello!');
                    end;
                }
            }
            group(subGroup2)
            {
                action(helloFromsubGroup21)
                {
                    Caption = 'hello From subGroup 21';
                    trigger OnAction()
                    begin
                        Message('Hello!');
                    end;
                }
            }

        }

        area(Reporting)
        {
            group(NewSubGroup)
            {
                Caption = 'sub Group 1';
                group(MyGroup)
                {
                    action(helloFromReporting)
                    {
                        Caption = 'hello From Reporting';
                        trigger OnAction()
                        begin
                            Message('Hello!');
                        end;
                    }
                }
            }

            group(NewSubGroup2)
            {
                Caption = 'sub Group 2';
                group(mysubGroup21)
                {
                    action(HelloFromSubGroup21Action)
                    {
                        Caption = 'Hello From SubGroup 21 action';
                        trigger OnAction()
                        begin
                            Message('Hello!');
                        end;
                    }
                }
                group(mysubGroup22)
                {
                    action(HelloFromSubGroup2)
                    {
                        Caption = 'Hello From SubGroup 22 action';
                        trigger OnAction()
                        begin
                            Message('Hello!');
                        end;
                    }
                }
            }

        }
    }
}