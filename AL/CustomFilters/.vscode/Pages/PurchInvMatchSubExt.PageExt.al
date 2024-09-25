pageextension 60100 "CDC Purch. Inv. Match Sub. Ext" extends "CDC Purch. Invoice Match Subp."
{
    procedure SetFilters(Document: Record "CDC Document");
    var
        RecRef: RecordRef;
        FieldRef: FieldRef;
        RecIDMgt: Codeunit "CDC Record ID Mgt.";
        MatchFilters: record "CDC Match Filters";
        CaptureMgt: Codeunit "CDC Capture Management";
        FilterStr: Text;
        TemplateField: Record "CDC Template Field";
        RecHasFilters: Boolean;
    begin
        RecHasFilters := Rec.HASFILTER;
        RecRef.GETTABLE(Rec);
        MatchFilters.SETRANGE("Template No.", Document."Template No.");
        MatchFilters.SETRANGE("Table No.", DATABASE::"Purch. Rcpt. Line");
        IF NOT MatchFilters.FINDSET THEN
            EXIT;

        REPEAT
            if RecHasFilters then
                RecRef.Reset()
            else begin
                FilterStr := CaptureMgt.GetText(Document, TemplateField.Type::Header, MatchFilters."Filter Field", 0);
                RecIDMgt.FilterRecRef(RecRef, MatchFilters."Field No.", FilterStr);
            end;
        UNTIL MatchFilters.NEXT = 0;

        RecRef.SETTABLE(Rec);
        CurrPage.Update(false);
    end;
}