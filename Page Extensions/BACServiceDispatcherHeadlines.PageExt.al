pageextension 78508 "BAC Serv.Dispatcher Headlines" extends "Headline RC Serv. Dispatcher"
{
    layout
    {
        addlast(content)
        {
            group("BAC Messages")
            {
                ShowCaption = false;
                field(HeadlineText1; HeadlineText[1])
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Editable = false;
                    Visible = HeadlinePart1Visible;

                    trigger OnDrillDown()
                    begin
                        if DrillDown1Visible and (HyperLinkText[1] <> '') then
                            Hyperlink(HyperLinkText[1]);
                    end;
                }
                field(HeadlineText2; HeadlineText[2])
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Editable = false;
                    Visible = HeadlinePart2Visible;

                    trigger OnDrillDown()
                    begin
                        if DrillDown2Visible and (HyperLinkText[2] <> '') then
                            Hyperlink(HyperLinkText[2]);
                    end;

                }
                field(HeadlineText3; HeadlineText[3])
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Editable = false;
                    Visible = HeadlinePart3Visible;
                    trigger OnDrillDown()
                    begin
                        if DrillDown3Visible and (HyperLinkText[3] <> '') then
                            Hyperlink(HyperLinkText[3]);
                    end;
                }
                field(HeadlineText4; HeadlineText[4])
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Editable = false;
                    Visible = HeadlinePart4Visible;
                    trigger OnDrillDown()
                    begin
                        if DrillDown4Visible and (HyperLinkText[4] <> '') then
                            Hyperlink(HyperLinkText[4]);
                    end;
                }
                field(HeadlineText5; HeadlineText[5])
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Editable = false;
                    Visible = HeadlinePart5Visible;
                    trigger OnDrillDown()
                    begin
                        if DrillDown5Visible and (HyperLinkText[5] <> '') then
                            Hyperlink(HyperLinkText[5]);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        RCSelection: Record "BAC Headline Selection";
    begin
        if not RCSelection.Get(1448) then
            Clear(RCSelection);
       if not RCSelection.Selected then
            exit;
        HeadlineMgt.GetUserMessages(1, HeadlineText[1], HyperLinkText[1]);
        HeadlinePart1Visible := HeadlineText[1] <> '';
        DrillDown1Visible := HyperLinkText[1] <> '';
        HeadlineMgt.GetUserMessages(2, HeadlineText[2], HyperLinkText[2]);
        HeadlinePart2Visible := HeadlineText[2] <> '';
        DrillDown2Visible := HyperLinkText[2] <> '';
        HeadlineMgt.GetUserMessages(3, HeadlineText[3], HyperLinkText[3]);
        HeadlinePart3Visible := HeadlineText[3] <> '';
        DrillDown3Visible := HyperLinkText[3] <> '';
        HeadlineMgt.GetUserMessages(4, HeadlineText[4], HyperLinkText[4]);
        HeadlinePart4Visible := HeadlineText[4] <> '';
        DrillDown4Visible := HyperLinkText[4] <> '';
        HeadlineMgt.GetUserMessages(5, HeadlineText[5], HyperLinkText[5]);
        HeadlinePart5Visible := HeadlineText[5] <> '';
        DrillDown5Visible := HyperLinkText[5] <> '';
    end;

    var
        HeadlineMgt: Codeunit "BAC Headline Mgt";
        HeadlinePart1Visible: Boolean;
        HeadlinePart2Visible: Boolean;
        HeadlinePart3Visible: Boolean;
        HeadlinePart4Visible: Boolean;
        HeadlinePart5Visible: Boolean;
        DrillDown1Visible: Boolean;
        DrillDown2Visible: Boolean;
        DrillDown3Visible: Boolean;
        DrillDown4Visible: Boolean;
        DrillDown5Visible: Boolean;
        HeadlineText: array[5] of Text[250];
        HyperLinkText: array[5] of Text[250];
}