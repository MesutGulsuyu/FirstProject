tableextension 50101 GeneralLedgerEnt extends "G/L Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50001;SourceName;Text[50])
        {
            CaptionML = ENU = 'Source Name',
                        TRK = 'Kaynak Adı';
        }
    }
    
    var
        myInt : Integer;
}