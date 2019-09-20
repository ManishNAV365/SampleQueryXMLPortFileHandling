codeunit 50002 MyTempBlobMgt
{
    procedure StreamingExample1()
    var
        Tempblob: Record TempBlob temporary;
        outStr: OutStream;
        inStr: InStream;
        filename: Text;
        ContactExport: XmlPort ContactExport;
    begin
        //create the outstream from blob Notice the encoding
        Tempblob.Blob.CreateOutStream(outStr, TextEncoding::UTF8);

        //write the content of the xmlport to the outstream
        ContactExport.SetDestination(outStr);
        ContactExport.Export();

        //From the same blob , that now contains the xml document . create an instream
        Tempblob.Blob.CreateInStream(inStr, TextEncoding::UTF8);

        //Save the data of the Instream as a file
        filename := 'MyxmlportContact.txt';
        File.DownloadFromStream(inStr, 'Export', '', '', filename);

        //Importing xmlport
        /*
        FileName := 'C:\temp\TESTXML.txt';
        TestFile.OPEN(FileName);
        TestFile.CREATEINSTREAM(Instream);
        TemporaryItemXMLPort.SETSOURCE(Instream);
        TemporaryItemXMLPort.IMPORT;
        TestFile.CLOSE;

        ImportXmlFile.OPEN('C:\Import\NewCustomer.xml');  
        ImportXmlFile.CREATEINSTREAM(XmlINStream);  
        XMLPORT.IMPORT(50004, XmlINStream);  
        ImportXmlFile.CLOSE; 
        */
    end;
}