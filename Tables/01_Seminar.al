table 123456701 Seminar
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "No."; code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if Rec."No." <> xrec."No." then begin
                    SeminarSetup.get();
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;

            end;
        }
        field(20; "Name"; text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if("Search Name" = UpperCase(xRec.Name)) or("Search Name" = '') then
                    "Search Name" := Name;

            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
            DataClassification = ToBeClassified;
        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(60; "Search Name"; code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(90; "Comment"; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            //CalcFormula=exist("Seminar Comment Line") where("Table Name"= const("Seminar")),"No."=field("No.")));
            //DataClassification = ToBeClassified;
        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if(xrec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        "VAT Prod. Posting Group" := GenProdPostingGroup."Def. VAT Prod. Posting Group";
                end;
            end;

        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(130; "No. Series"; code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup: Record "Seminar Setup";
        CommentLine:Record "Seminar Comment Line";
        Seminar: Record Seminar;
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        CommentLine.Reset;
        CommentLine.SetRange("Table Name",CommentLine."Table Name"::Seminar);
        CommentLine.SetRange("No.","No.");
        CommentLine.DeleteAll;
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do
        begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}