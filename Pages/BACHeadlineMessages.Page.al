page 78506 "BAC Headline Messages"
{
    Caption = 'Headline Messages';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BAC Headline Message";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Message; Rec.Message)
                {

                }
                field("Segment Code"; Rec."Segment Code")
                {

                }
                field("From Date"; Rec."From Date")
                {

                }
                field("To Date"; Rec."To Date")
                {

                }
                field(Hyperlink; Rec.Hyperlink)
                {

                }
            }
        }
    }

actions
{
    area(Processing)
    {
            action(Translations)
            {
                Caption = 'Translations';
                Promoted = true;
                PromotedCategory = Process;
                Image = List;
                RunObject = page "BAC Translations";
                RunPageLink = "Entry No."=field("Entry No.");
                ApplicationArea = All;
            }
    }
}
    trigger OnClosePage()
    var
        NoSegemntWarningLbl: Label 'No Segments have been selected for this message - Close anyway?';
    begin
        if (Rec."Segment Code" = '') then
            if not Confirm(NoSegemntWarningLbl) then
                exit;
    end;
}