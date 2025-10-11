table 78504 "BAC User Headline Segment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
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
        field(4; "User Name"; Text[100])
        {
            Caption = 'User Name';
            FieldClass = FlowField;
            CalcFormula = lookup(User."Full Name" where("User Name" = field("User ID")));
        }

    }

    keys
    {
        key(Key1; "User ID", "Headline Segment Code")
        {
            Clustered = true;
        }
    }
}