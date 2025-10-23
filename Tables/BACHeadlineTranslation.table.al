table 78501 "BAC Headline Translation"
{
    Caption = 'Headline Translation';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = SystemMetadata;
            TableRelation = Language;
        }
        field(3; "Translation"; Text[250])
        {
            Caption = 'Translation';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Language Code")
        {
            Clustered = true;
        }
    }
}