page 50110 StudentPageArash
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = StudentTableArash;
    Caption = 'Student Page';
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

                field(FullName; FullNameCal())
                {
                    Caption = 'Full Name';
                    Editable = false;
                    Style = Strong;
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
                    Caption = 'Phone';
                }

                field(Gender; Rec.Gender)
                {
                    Caption = 'Gender';
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


            //non funziona bene perche non ho creato il field in tabella perche a me non mi interessa avere le ridondanze
            //E vorrei calcolare il full name in page per none salvare il fullname in database. invece ancora ho usato il
            // valore che ho salvato in  "General Ledger Setup" ma in modo di un procedure!!!

            // action(GiveTitle)
            // {
            //     Caption = 'Give Title to the person';
            //     trigger OnAction()
            //     var
            //         StudentTable: Record StudentTableArash;
            //         MyGeneralLedgerSetup: Record "General Ledger Setup";
            //         MyMessage: label 'Added!';
            //         gender: Enum GenderArash;
            //         FullNameAction: Text[200];
            //     begin
            //         MyGeneralLedgerSetup.Get();
            //         StudentTable.Reset();
            //         if StudentTable.find('-') then begin
            //             repeat
            //                 if StudentTable.Gender = Gender::Man then
            //                     FullNameAction := MyGeneralLedgerSetup.malePrefixArash + ' ' + StudentTable.FirstName + ' ' + StudentTable.LastName;
            //                 exit;
            //                 if StudentTable.Gender = Gender::Woman then
            //                     FullNameAction := MyGeneralLedgerSetup.femalePrefixArash + ' ' + StudentTable.FirstName + ' ' + StudentTable.LastName;
            //                 exit;
            //                 if StudentTable.Gender = Gender::Other then
            //                     FullNameAction := MyGeneralLedgerSetup.OtherPrefixArash + ' ' + StudentTable.FirstName + ' ' + StudentTable.LastName;
            //                 exit;
            //             until StudentTable.Next() = 0;
            //         end;

            //         Message(MyMessage);
            //     end;
            // }
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


    procedure FullNameCal(): Text
    var
        StudentTable: Record StudentTableArash;
        Gender: Enum GenderArash;
        FullName: Text[100];
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        StudentTable.Reset();
        GeneralLedgerSetup.Get();
        if (StudentTable.Find('-')) then begin
            REPEAT
                if (StudentTable.ID = rec.ID) then begin

                    if StudentTable.Gender = Gender::Man then begin
                        FullName := GeneralLedgerSetup.malePrefixArash + ' ' + rec.FirstName + ' ' + rec.LastName;
                        exit(FullName);
                    end;
                    if StudentTable.Gender = Gender::Woman then begin
                        FullName := GeneralLedgerSetup.femalePrefixArash + ' ' + rec.FirstName + ' ' + rec.LastName;
                        exit(FullName);
                    end;
                    if StudentTable.Gender = Gender::Other then begin
                        FullName := GeneralLedgerSetup.OtherPrefixArash + ' ' + rec.FirstName + ' ' + rec.LastName;
                        exit(FullName);
                    end;
                end;
            UNTIL StudentTable.NEXT = 0;
        end;
    end;

}