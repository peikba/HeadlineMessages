codeunit 78501 "BAC Headline Mgt"
{
    procedure GetUserMessages(inMessageNo: Integer; var OutMessage: Text[250]; var OutHyperLink: Text[250])
    var
        UserSegment: Record "BAC User Headline Segment";
        HeadlineMessage: Record "BAC Headline Message";
        SegmentCounter: Integer;
    begin
        UserSegment.SetRange("User ID", UserId());
        if UserSegment.FindSet() then
            repeat
                SegmentCounter += 1;
                if SegmentCounter = inMessageNo then begin
                    HeadlineMessage.SetRange("Segment Code", UserSegment."Headline Segment Code");
                    HeadlineMessage.SetFilter("From Date", '<=%1', WorkDate());
                    HeadlineMessage.SetFilter("To Date", '>=%1', WorkDate());
                    if HeadlineMessage.FindFirst() then begin
                        OutMessage := HeadlineMessage.Message;
                        OutHyperLink := HeadlineMessage.Hyperlink;
                        exit;
                    end;
                end;
            until UserSegment.Next() = 0;
    end;
}