table 78506 "BAC Message Headline Segment"
{
    Caption = 'BAC Message Headline Segment';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Headline Segment Code"; Code[20])
        {
            Caption = 'Headline Segment Code';
            DataClassification = SystemMetadata;
            TableRelation = "BAC Headline Segments";
        }
        field(3; "Headline Segment Description"; Text[100])
        {
            Caption = 'Segment Description';
            FieldClass = FlowField;
            CalcFormula = lookup("BAC Headline Segments".Description where(Code = field("Headline Segment Code")));
        }

    }

    keys
    {
        key(Key1; "Entry No.", "Headline Segment Code")
        {
            Clustered = true;
        }
    }
}