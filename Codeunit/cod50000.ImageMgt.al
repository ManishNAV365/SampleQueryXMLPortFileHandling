codeunit 50000 ImageMgt
{
    trigger OnRun()
    begin

    end;

    procedure ImportItemPicture(Item: Record Item)
    var
        PicInstream: InStream;
        FromFileName: Text;
        OverrideImageQst: Label 'The existing picture will be replaced do you want to continue?', Locked = false, MaxLength = 250;
    begin
        with Item do begin
            if Picture.count > 0 then
                if not confirm(OverrideImageQst) then
                    Exit;

            if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, PicInstream) then begin
                Clear(Picture);
                Picture.ImportStream(PicInstream, FromFileName);
                Modify(true);
            end;
        end;
    end;

    Procedure ExportItemPicture(Item: Record Item)
    var
        PicInstream: InStream;
        Index: Integer;
        TenantMedia: Record "Tenant Media";
        FileName: Text;
    begin
        with Item do begin
            if Picture.Count = 0 then
                exit;

            For Index := 1 to Picture.Count do begin
                if TenantMedia.Get(Picture.Item(Index)) then begin
                    TenantMedia.CalcFields(Content);
                    if TenantMedia.Content.HasValue then begin
                        FileName := TableCaption + '_Image' + format(Index) + GetTenantMediaFileExtension(TenantMedia);
                        TenantMedia.Content.CreateInStream(PicInstream);
                        DownloadFromStream(PicInstream, '', '', '', FileName);
                    end;
                end;
            end;
        end;
    end;

    local procedure GetTenantMediaFileExtension(var TenantMedia: Record "Tenant Media"): Text
    begin
        case TenantMedia."Mime Type" of
            'image/jpeg':
                exit('.jpg');
            'image/png':
                exit('.jpg');
            'image/bmp':
                exit('.jpg');
            'image/gif':
                exit('.jpg');
            'image/tiff':
                exit('.jpg');
            'image/wmf':
                exit('.jpg');
        end;
    end;

    var
        myInt: Integer;
}