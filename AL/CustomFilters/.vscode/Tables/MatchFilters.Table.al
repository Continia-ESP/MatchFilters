table 60100 "CDC Match Filters"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "CDC Template";


        }
        field(5; "Table No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = AllObjWithCaption."Object ID";
            trigger OnValidate()
            var
                Objects: Record AllObjWithCaption;
            begin
                if Objects.Get(Objects."Object Type"::TableData, "Table No.") then
                    "Table Name" := Objects."Object Caption"
                else
                    "Table Name" := '';
            end;


        }
        field(6; "Table Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(10; "Field No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = Field."No." where(TableNo = field("Table No."));
            trigger OnValidate()
            var
                Fields: Record Field;
            begin
                if Fields.Get("Table No.", "Field No.") then
                    "Field Name" := Fields."Field Caption"
                else
                    "Field Name" := '';
            end;
        }
        field(11; "Field Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(15; "Filter Field"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "CDC Template Field".Code where("Template No." = field("Template No."));
        }
    }

    keys
    {
        key(Key1; "Template No.", "Table No.", "Field No.")
        {
            Clustered = true;
        }
    }

}