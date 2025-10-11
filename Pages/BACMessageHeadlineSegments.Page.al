page 78507 "BAC Message Headline Segments"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BAC Message Headline Segment";

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