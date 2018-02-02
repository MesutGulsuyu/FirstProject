codeunit 50103 UpdGenLedEntCDU
{
    trigger OnRun();
    begin
    end;
    
    var
        myInt : Integer;

    procedure UpdateSourceName()
        var GenLedEnt : Record "G/L Entry";
             Customer : record Customer;
             Vendor : record Vendor;
             Employee : record Employee;
             BankAccount : Record "Bank Account";
             FixedAssed : record "Fixed Asset";

        begin
            GenLedEnt.SetFilter("Source No.",'<>%1','');
            GenLedEnt.SetFilter("Source Type",'<>%1',GenLedEnt."Source Type"::" ");
            if GenLedEnt.FindFirst() then 
                repeat
                    If GenLedEnt."Source Type" = GenLedEnt."Source Type"::Customer then 
                    begin   
                        Customer.Get(GenLedEnt."Source No.");
                        GenLedEnt.SourceName := Customer.Name;
                    end;
                    If GenLedEnt."Source Type" = GenLedEnt."Source Type"::Vendor then 
                    begin   
                        Vendor.Get(GenLedEnt."Source No.");
                        GenLedEnt.SourceName := Vendor.Name;
                    end else
                    If GenLedEnt."Source Type" = GenLedEnt."Source Type"::"Bank Account" then 
                    begin   
                        BankAccount.Get(GenLedEnt."Source No.");
                        GenLedEnt.SourceName := BankAccount.Name;
                    end else
                    If GenLedEnt."Source Type" = GenLedEnt."Source Type"::Employee then 
                    begin   
                        Employee.Get(GenLedEnt."Source No.");
                        GenLedEnt.SourceName := Employee."First Name";
                    end else
                    If GenLedEnt."Source Type" = GenLedEnt."Source Type"::"Fixed Asset" then 
                    begin   
                        FixedAssed.Get(GenLedEnt."Source No.");
                        GenLedEnt.SourceName := FixedAssed.Description;
                    end;
                    GenLedEnt.Modify;
                Until GenLedEnt.Next = 0;    
        end;
}