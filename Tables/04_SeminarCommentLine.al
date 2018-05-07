table 123456704 "Seminar Comment Line"
{
    Caption = 'Seminar Comment Line';
    DataClassification = ToBeClassified;
    LookupPageId = "Seminar Comment List";
    DrillDownPageId ="Seminar Comment List";
    
    fields
    {
        field(10;"Table Name";Option)
        {
            Caption = 'Table Name';
            OptionMembers = "Seminar","Seminar Registration","Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration,Seminar Registration Header,Posted Seminar Reg. Header';
            DataClassification = ToBeClassified;
        }
        field(20;"Document Line No.";Integer)
        {
            Caption = 'Document Line No.';
            DataClassification = ToBeClassified;
        }
        field(30;"No.";code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = if("Table Name"=CONST(Seminar)) Seminar;
        }
        field(40;"Line No.";Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(50;"Date";Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(60;"Code";code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(70;"Comment";Text[80])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
        
    }

    keys
    {
        key(PK;"Table Name","Document Line No.","No.","Line No.")
        {
            Clustered = true;
        }
    }
    
}