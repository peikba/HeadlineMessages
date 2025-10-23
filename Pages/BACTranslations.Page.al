page 78501 "BAC Translations"
{
    Caption = 'Translations';
    PageType = List;
    SourceTable = "BAC Headline Translation";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(DocumentText)
            {
                Caption = 'Document Text';
                field(HeadlineSetup; OriginalText)
                {
                    Editable = false;
                }

            }
            repeater(GroupName)
            {
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the language code for the Translation';
                }
                field(Translation; Rec.Translation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Translation for the Default Document Text - %1 in the text will insert the company name';

                }
            }
        }
    }
    trigger OnOpenPage()
    var
        HeadlineSetup: Record "BAC Headline Setup";
        HeadlineMessage: Record "BAC Headline Message";
        EntryNoInt: Integer;
    begin
        HeadlineSetup.Get();
        if Rec.GetFilter("Entry No.") = '0' then
            OriginalText := HeadlineSetup."Default Message Text"
        else begin
            Evaluate(EntryNoInt, Rec.GetFilter("Entry No."));
            HeadlineMessage.SetRange("Entry No.", EntryNoInt);
            if HeadlineMessage.FindFirst() then
                OriginalText := HeadlineMessage.Message;
        end;
    end;

    var
        OriginalText: Text[250];
}