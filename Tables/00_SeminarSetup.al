table 123456700 "Seminar Setup"
{
    Caption = 'Seminar Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"Primary Key";code[10])
        {
            Caption = 'Primary Key';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(20;"Seminar Nos.";code[20])
        {
            Caption = 'Seminar Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(30;"Seminar Registration Nos.";code[20])
        {
            Caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(40;"Posted Seminar Reg. Nos.";code[20])
        {
            Caption = 'Posted Seminar Reg. Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }

}