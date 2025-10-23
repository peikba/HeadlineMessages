table 78500 "BAC Headline Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Default Message Text"; Text[250])
        {
            Caption = 'Default Message Text';
            DataClassification = SystemMetadata;
        }
        field(3; "Default Message URL"; Text[250])
        {
            Caption = 'Default Message URL';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

}