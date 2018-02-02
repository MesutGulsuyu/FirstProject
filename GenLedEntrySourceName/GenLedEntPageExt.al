pageextension 50102 SourceNameEx extends "General Ledger Entries"
{

    layout
    {
        addlast(Control1)
        {
                    // Add changes to page layout here
            field("Source Name";SourceName)
            {
                
            }
        }
    }

    actions
    {

    }
    
    var
        GeneralLedgerSetup :Record "General Ledger Setup";

    trigger OnOpenPage();
    var UpdGenLedEntCDU : Codeunit UpdGenLedEntCDU;
        
    begin  
        IF GeneralLedgerSetup.Get then
            If Not  GeneralLedgerSetup.GeneralLedgerEntry then
                 UpdGenLedEntCDU.UpdateSourceName();  

        GeneralLedgerSetup.GeneralLedgerEntry := true;                
    end;
    
}