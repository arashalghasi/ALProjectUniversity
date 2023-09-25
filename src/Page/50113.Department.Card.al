page 50113 DepartmentCardArash
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DepartmentTableArash;
    Caption = 'Department Card Arash';

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
                field(DepartmentName; rec.DepartmentName)
                {
                    ApplicationArea = All;
                    Caption = 'Department Name';
                }
            }
        }
    }
}