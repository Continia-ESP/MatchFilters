tableextension 60100 "CDC Purch. Rcprt Line Ext." extends "Purch. Rcpt. Line"
{
    fields
    {
        field(60100; "CDC Vendor Shipment No."; Code[35])
        {
            DataClassification = CustomerContent;
            Editable = false;
            CaptionML = ENU = 'Vendor Shipment No."', ESP = 'Nº albarán proveedor';

        }
    }
}