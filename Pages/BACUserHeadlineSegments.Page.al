page 78505 "BAC User Headline Segments"
{
    Caption = 'User Headline Segments';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BAC User Headline Segment";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Headline Segment Code"; Rec."Headline Segment Code")
                {

                }
                field("Headline Segment Description"; Rec."Headline Segment Description")
                {

                }
            }
        }
    }
}