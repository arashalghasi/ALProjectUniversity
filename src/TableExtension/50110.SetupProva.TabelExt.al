tableextension 50110 "Setup Prova Arash" extends "General Ledger Setup"
{
    fields
    {
        field(50003; malePrefixArash; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'male Prefix Arash';
        }
        field(50002; femalePrefixArash; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'female Prefix Arash';
        }
        field(50004; OtherPrefixArash; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Other Prefix Arash';
        }
    }
}