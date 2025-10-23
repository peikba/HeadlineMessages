permissionset 78500 "BAC Gen.Permission"
{
    Caption='BAC GeneratedPermission';
    Assignable = true;
    Permissions = tabledata "BAC Headline Message"=RIMD,
        tabledata "BAC Headline Segments"=RIMD,
        tabledata "BAC Headline Selection"=RIMD,
        tabledata "BAC Headline Setup"=RIMD,
        tabledata "BAC Headline Translation"=RIMD,
        tabledata "BAC User Headline Segment"=RIMD,
        table "BAC Headline Message"=X,
        table "BAC Headline Segments"=X,
        table "BAC Headline Selection"=X,
        table "BAC Headline Setup"=X,
        table "BAC Headline Translation"=X,
        table "BAC User Headline Segment"=X,
        codeunit "BAC Event Subscriptions"=X,
        codeunit "BAC Headline Mgt"=X,
        page "BAC Headline Messages"=X,
        page "BAC Headline Pages"=X,
        page "BAC Headline Segments"=X,
        page "BAC Headline Setup"=X,
        page "BAC Translations"=X,
        page "BAC User Headline Segments"=X;
}