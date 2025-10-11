codeunit 78501 "BAC Headline Mgt"
{
    procedure GetUserMessages(inMessageNo: Integer): Text
    var
        UserSegment: Record "BAC User Headline Segment";
        HeadlineMessages: Record "BAC Headline Message";
        MessageHeadlineSegment: Record "BAC Message Headline Segment";
        SegmentCounter: Integer;
    begin
        UserSegment.SetRange("User ID", UserId());
        if UserSegment.FindSet() then
            repeat
                SegmentCounter += 1;
                if SegmentCounter = inMessageNo then begin
                    MessageHeadlineSegment.SetRange("Headline Segment Code", UserSegment."Headline Segment Code");
                    if MessageHeadlineSegment.FindFirst() then begin
                        HeadlineMessages.Get(MessageHeadlineSegment."Entry No.");
                        exit(HeadlineMessages.Message);
                    end;
                end;
            until UserSegment.Next() = 0;
    end;
}