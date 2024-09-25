codeunit 60100 "CDC Match Filters Subscriber"
{
    Permissions = Tabledata "purch. rcpt. line" = Rm;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDC Purch. Doc. - Management", 'OnAfterSetPurchRcptLineFilters', '', false, false)]
    local procedure OnAfterSetPurchRcptLineFilters(Document: Record "CDC Document"; var PurchRcptLine: Record "Purch. Rcpt. Line");
    var
        RecRef: RecordRef;
        FieldRef: FieldRef;
        MatchFilters: record "CDC Match Filters";
        CaptureMgt: Codeunit "CDC Capture Management";
        FilterStr: Text;
        TemplateField: Record "CDC Template Field";
    begin
        RecRef.GETTABLE(PurchRcptLine);
        MatchFilters.SETRANGE("Template No.", Document."Template No.");
        MatchFilters.SETRANGE("Table No.", DATABASE::"Purch. Rcpt. Line");
        IF NOT MatchFilters.FINDSET THEN
            EXIT;

        REPEAT
            FilterStr := CaptureMgt.GetText(Document, TemplateField.Type::Header, MatchFilters."Filter Field", 0);
            FilterRecRef(RecRef, MatchFilters."Field No.", FilterStr);
        UNTIL MatchFilters.NEXT = 0;

        RecRef.SETTABLE(PurchRcptLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchRcptLineInsert', '', false, false)]
    local procedure OnAfterOurchRcptLineInsert(var PurchRcptLine: Record "Purch. Rcpt. Line");
    var
        PurchRcptHeader: record "Purch. Rcpt. Header";
    begin
        if not PurchRcptHeader.get(PurchRcptLine."Document No.") then
            exit;
        PurchRcptLine."CDC Vendor Shipment No." := PurchRcptHeader."Vendor Shipment No.";
        PurchRcptLine.modify(false);
    end;

    local procedure FilterRecRef(var RecRef: RecordRef; FieldNo: Integer; FieldFilter: Text[250])
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.FIELD(FieldNo);
        // Changed to SETRANGE to handle vendors with filter symbols in number, e.g. the & symbol
        // When the field type is option, a SETRANGE results in the following error: The type NavOption is unknown.
        // A similary error happens for boolean fields.
        // We therefore keep SETFILTER for option and boolean fields
        IF (FORMAT(FieldRef.TYPE) = 'Option') OR (FORMAT(FieldRef.TYPE) = 'Boolean') OR (FORMAT(FieldRef.TYPE) = 'Date') THEN
            FieldRef.SETFILTER(FieldFilter)
        ELSE
            FieldRef.SETRANGE(FieldFilter);
    end;

}