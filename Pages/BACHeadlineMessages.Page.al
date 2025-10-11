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
                field("From Date"; Rec."From Date")
                {

                }
                field("To Date"; Rec."To Date")
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(AttachedSegments)
            {
                Caption = 'AttachedSegments';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Enter the segments attached to this message';
                RunObject = page "BAC Message Headline Segments";
                RunPageLink = "Entry No." = field("Entry No.");
            }
        }
    }
    trigger OnClosePage()
    var
        MessageSegment: Record "BAC Message Headline Segment";
        NoSegemntWarningLbl: Label 'No Segments have been selected for this message - Close anyway?';
    begin
        MessageSegment.SetRange("Entry No.", Rec."Entry No.");
        if MessageSegment.IsEmpty then
            if not Confirm(NoSegemntWarningLbl) then
                exit;
    end;
}