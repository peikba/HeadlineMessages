table 78505 "BAC Headline Message"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Message; Text[250])
        {
            Caption = 'Message';
            DataClassification = SystemMetadata;
        }
        field(3; "From Date";Date)
        {
            Caption = 'From Date';
            DataClassification = SystemMetadata;
        }
        field(4; "To Date";Date)
        {
            Caption = 'To Date';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
}