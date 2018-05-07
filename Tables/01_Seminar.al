table 123456701 Seminar
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"No.";code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(20;"Name";text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
            DataClassification = ToBeClassified;
        }
        field(40;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(60;"Search Name";code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(70;"Blocked";Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(90;"Comment";Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            //FieldClass = FlowField;
            //CalcFormula=exist("Seminar Comment Line")
            //where("Table Name"= const("Seminar")),
            //      "No."=field("No.")));
            DataClassification = ToBeClassified;
        }
        field(100;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(110;"Gen. Prod. Posting Group";code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(120;"VAT Prod. Posting Group";code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(130;"No. Series";code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup:Record "Seminar Setup";
        //CommentLine:Record "Seminar Comment Line";
        Seminar:Record Seminar;
        GenProdPostingGroup:Record "Gen. Product Posting Group";
        NoSeriesMgt:Codeunit NoSeriesManagement;

        trigger OnInsert();
        begin
            if "No."='' then begin
                SeminarSetup.get;
                SeminarSetup.TestField("Seminar Nos.");
                NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
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
            //CommentLine.Reset;
            //CommentLine.SetRange("Table Name",CommentLine."Table Name"::Seminar);
            //CommentLine.SetRange("No.","No.");
            //CommentLine.DeleteAll;
        end;
}