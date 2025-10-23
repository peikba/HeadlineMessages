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
            ToolTip = 'The message to be shown';
            DataClassification = SystemMetadata;
        }
        field(3; "From Date"; Date)
        {
            Caption = 'From Date';
            ToolTip = 'Start date for the message';
            DataClassification = SystemMetadata;
            trigger OnValidate()
            begin
                if ("From Date" <> xRec."From Date") and ("From Date" > "To Date") then
                    clear("To Date");
            end;
        }
        field(4; "To Date"; Date)
        {
            Caption = 'To Date';
            ToolTip = 'End date for the message';
            DataClassification = SystemMetadata;
            trigger OnValidate()
            var
                WrongToDateLbl: Label '%1 cannot be less than %2', Comment = '%1=To Date %2=From Date';
            begin
                if "To Date" <> xRec."To Date" then
                    if ("To Date" < "From Date") then
                        Error(WrongToDateLbl, "To Date", "From Date");
            end;
        }
        field(5; Hyperlink; Text[250])
        {
            Caption = 'Hyperlink';
            ToolTip = 'Hyperlink for drilldown';
            DataClassification = SystemMetadata;
        }
        field(6; "Segment Code"; Code[20])
        {
            Caption = 'Segment Code';
            ToolTip = 'Choose which segment the message should apply to';
            DataClassification = SystemMetadata;
            TableRelation = "BAC Headline Segments";
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