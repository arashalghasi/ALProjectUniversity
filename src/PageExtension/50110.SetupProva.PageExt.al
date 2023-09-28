pageextension 50110 "Setup Prova Arash" extends "General Ledger Setup"
{
    layout
    {
        addlast(General)
        {
            field(malePrefixArash; Rec.malePrefixArash)
            {
                Caption = 'Male Prefix Arash';
                ApplicationArea = All;

            }
            field(femalePrefixArash; Rec.femalePrefixArash)
            {
                Caption = 'Female Prefix Arash';
                ApplicationArea = All;
            }
            field(OtherPrefixArash; Rec.OtherPrefixArash)
            {
                Caption = 'Other Prefix Arash';
                ApplicationArea = All;
            }
        }
    }
}