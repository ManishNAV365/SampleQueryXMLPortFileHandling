codeunit 50003 QueryDemo
{
    trigger OnRun()
    begin

    end;

    procedure StreamyQueryToCSV()
    var
        Tempblob: Record TempBlob temporary;
        outstr: OutStream;
        instr: InStream;
        filename: Text;
        MyQuery: Query SimpleCustomerQuery;
    begin
        // Create an outsream 
        Tempblob.Blob.CreateOutStream(outstr, TextEncoding::UTF8);

        //Write the contents of query to the stream
        MyQuery.SaveAsCsv(outstr);

        //From the same blob create instr
        Tempblob.Blob.CreateInStream(instr, TextEncoding::UTF8);

        //Save the data of the instream as a file
        filename := 'MyQuery.txt';
        file.DownloadFromStream(instr, 'Export', '', '', filename);
    end;

    procedure StreamyQueryToXML()
    var
        Tempblob: Record TempBlob temporary;
        outstr: OutStream;
        instr: InStream;
        filename: Text;
        MyQuery: Query SimpleCustomerQuery;
    begin
        // Create an outsream 
        Tempblob.Blob.CreateOutStream(outstr, TextEncoding::UTF8);

        //Write the contents of query to the stream
        MyQuery.SaveAsXml(outstr);

        //From the same blob create instr
        Tempblob.Blob.CreateInStream(instr, TextEncoding::UTF8);

        //Save the data of the instream as a file
        filename := 'MyQuery.xml';
        file.DownloadFromStream(instr, 'Export', '', '', filename);
    end;
}