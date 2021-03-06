codeunit 123456739 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD_Seminar No." := ResJournalLine."CSD_Seminar No.";
        ResLedgerEntry."CSD_Seminar Registration No." := ResJournalLine."CSD_Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateFindRecords(DocumentEntry: record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        SeminarLedgerEntry: record "Seminar Ledger Entry";
        PostedSeminarRegHeader: record "Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;
    begin
        if PostedSeminarRegHeader.ReadPermission then begin
            PostedSeminarRegHeader.Reset;
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.Count;
            With DocumentEntry do
            begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := COPYSTR(PostedSeminarRegHeader.TableCaption, 1, MAXSTRLEN("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
            end;
        end;
        if SeminarLedgerEntry.ReadPermission then begin
            SeminarLedgerEntry.Reset;
            SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := SeminarLedgerEntry.Count;
            With DocumentEntry do
            begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"Seminar Ledger Entry";
                "Document Type" := 0;
                "Table Name" := COPYSTR(SeminarLedgerEntry.TableCaption, 1, MAXSTRLEN("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure ExtendOnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean)
    var
        SeminarLedgerEntry: record "Seminar Ledger Entry";
        PostedSeminarRegHeader: record "Posted Seminar Reg. Header";
    begin
        case TableID of
        Database::"Posted Seminar Reg. Header" :Page.Run(0, PostedSeminarRegHeader);
        Database::"Seminar Ledger Entry" :Page.Run(0, SeminarLedgerEntry);
        end;
    end;

}
