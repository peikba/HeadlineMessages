table 78501 "BAC Headline Translation"
{
    Caption = 'Headline Translation';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = SystemMetadata;
            TableRelation = Language;

        }
        field(2; "Translation"; Text[250])
        {
            Caption = 'Translation';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Language Code")
        {
            Clustered = true;
        }
    }
}