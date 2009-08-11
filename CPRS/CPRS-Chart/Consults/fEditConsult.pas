unit fEditConsult;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ORCtrls, ExtCtrls, ComCtrls, ORfn, uConst, uConsults, Buttons,
  Menus, fBase508Form, VA508AccessibilityManager;

type
  TfrmEditCslt = class(TfrmBase508Form)
    cboService: TORComboBox;
    cboUrgency: TORComboBox;
    radInpatient: TRadioButton;
    radOutpatient: TRadioButton;
    cboPlace: TORComboBox;
    txtProvDiag: TCaptionEdit;
    txtAttn: TORComboBox;
    lblReason: TLabel;
    lblService: TLabel;
    lblUrgency: TStaticText;
    lblPlace: TStaticText;
    lblAttn: TStaticText;
    lblProvDiag: TStaticText;
    cboCategory: TORComboBox;
    pnlMessage: TPanel;
    imgMessage: TImage;
    memMessage: TRichEdit;
    cmdAccept: TButton;
    cmdQuit: TButton;
    memComment: TRichEdit;
    lblComment: TLabel;
    lblComments: TLabel;
    btnCmtCancel: TButton;
    btnCmtOther: TButton;
    mnuPopProvDx: TPopupMenu;
    mnuPopProvDxDelete: TMenuItem;
    cmdLexSearch: TButton;
    lblInpOutp: TStaticText;
    memReason: TRichEdit;
    popReason: TPopupMenu;
    popReasonCut: TMenuItem;
    popReasonCopy: TMenuItem;
    popReasonPaste: TMenuItem;
    popReasonPaste2: TMenuItem;
    popReasonReformat: TMenuItem;
    procedure txtAttnNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure radInpatientClick(Sender: TObject);
    procedure radOutpatientClick(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmdQuitClick(Sender: TObject);
    procedure cmdAcceptClick(Sender: TObject);
    procedure memReasonExit(Sender: TObject);
    procedure OrderMessage(const AMessage: string);
    procedure btnCmtCancelClick(Sender: TObject);
    procedure btnCmtOtherClick(Sender: TObject);
    procedure cmdLexSearchClick(Sender: TObject);
    procedure mnuPopProvDxDeleteClick(Sender: TObject);
    procedure popReasonCutClick(Sender: TObject);
    procedure popReasonCopyClick(Sender: TObject);
    procedure popReasonPasteClick(Sender: TObject);
    procedure popReasonPopup(Sender: TObject);
    procedure popReasonReformatClick(Sender: TObject);
    procedure memCommentKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure memCommentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure memCommentKeyPress(Sender: TObject; var Key: Char);
  private
    FLastServiceID: string;
    FChanged: boolean;
    FChanging: boolean;
    FEditCtrl: TCustomEdit;
    FNavigatingTab: boolean;
    procedure SetProvDiagPromptingMode;
  protected
    procedure InitDialog;
    procedure Validate(var AnErrMsg: string);
    function  ValidSave: Boolean;
  end;

function EditResubmitConsult(FontSize: Integer; ConsultIEN: integer): boolean;

var
  frmEditCslt: TfrmEditCslt;

implementation

{$R *.DFM}

uses
    rODBase, rConsults, uCore, rCore, fConsults, fRptBox, fPCELex, rPCE,
    ORClasses, clipbrd, UBAGlobals, rOrders ;

var
  SvcList: TStrings ;
  OldRec, NewRec: TEditResubmitRec;
  Defaults: TStringList;
  uMessageVisible: DWORD;
  ProvDx: TProvisionalDiagnosis;
{Begin BillingAware}
  BADxUpdated: boolean;
{End BillingAware}

const
  TX_NOTTHISSVC_TEXT = 'Consults cannot be ordered from this service' ;
  TX_NO_SVC          = 'A service must be specified.'    ;
  TX_NO_REASON       = 'A reason for this consult must be entered.'  ;
  TX_SVC_ERROR       = 'This service has not been defined in your Orderable Items file.' +
                       #13#10'Contact IRM for assistance.' ;
  TX_NO_URGENCY      = 'An urgency must be specified.';
  TX_NO_PLACE        = 'A place of consultation must be specified';
  TX_NO_DIAG         = 'A provisional diagnosis must be entered for consults to this service.';
  TX_SELECT_DIAG     = 'You must use the "Lexicon" button to select a diagnosis for consults to this service.';
  TX_INACTIVE_CODE   = 'The provisional diagnosis code is not active as of today''s date.' + #13#10 +
                       'Another code must be selected';
  TC_INACTIVE_CODE   = 'Inactive ICD Code';

function EditResubmitConsult(FontSize: Integer; ConsultIEN: integer): boolean;
begin
  Result := False;
  if ConsultIEN = 0 then exit;
  FillChar(OldRec, SizeOf(OldRec), 0);
  FillChar(NewRec, SizeOf(NewRec), 0);
  FillChar(ProvDx, SizeOf(ProvDx), 0);
  OldRec := LoadConsultForEdit(ConsultIEN);
  NewRec.IEN := OldRec.IEN;
  NewRec.RequestType := OldRec.RequestType;
  with NewRec do
    begin
      RequestReason:= TStringList.Create ;
      DenyComments:= TStringList.Create ;
      OtherComments:= TStringList.Create ;
      NewComments:= TStringList.Create ;
    end;
  StatusText('Loading Consult for Edit');
  frmEditCslt := TfrmEditCslt.Create(Application);
  SvcList     := TStringList.Create ;
  Defaults    := TStringList.Create;
  try
    with frmEditCslt do
      begin
        ResizeAnchoredFormToFont(frmEditCslt);
        FChanged     := False;
        InitDialog;
        ShowModal ;
        Result := FChanged ;
      end ;
  finally
    OldRec.RequestReason.Free;
    OldRec.DenyComments.Free;
    OldRec.OtherComments.Free;
    OldRec.NewComments.Free;
    NewRec.RequestReason.Free;
    NewRec.DenyComments.Free;
    NewRec.OtherComments.Free;
    NewRec.NewComments.Free;
    SvcList.Free;
    Defaults.Free;
    frmEditCslt.Release;
  end;
end;

procedure TfrmEditCslt.InitDialog;
var
 i:integer;
begin
  FChanging := True;
  FastAssign(ODForConsults, Defaults);
  FLastServiceID := '';
  cboService.Items.Clear;
  if OldRec.InpOutp <> '' then
    case OldRec.InpOutp[1] of
      'I': radInpatient.Checked  := True;                 //INPATIENT CONSULT
      'O': radOutpatient.Checked := True;                 //OUTPATIENT CONSULT
    end
  else
    begin
      if Patient.Inpatient then
        radInpatient.Checked  := True
      else
        radOutpatient.Checked := True;  
    end;
  StatusText('Initializing Long List');
  FastAssign(LoadServiceList(CN_SVC_LIST_ORD), SvcList)   ;
  with cboService do
    begin
      for i := 0 to SvcList.Count - 1 do
        if SelectByID(Piece(SvcList.Strings[i], U, 1)) = -1 then
          Items.Add(SvcList.Strings[i]);
      SelectByID(IntToStr(OldRec.ToService));
    end;
  cboPlace.SelectByID(OldRec.Place);
  with cboUrgency do for i := 0 to Items.Count-1 do
    if UpperCase(DisplayText[i]) = UpperCase(OldRec.UrgencyName) then ItemIndex := i;
  txtProvDiag.Text := OldRec.ProvDiagnosis;
  ProvDx.Code := OldRec.ProvDxCode;
  if OldRec.ProvDxCodeInactive then
   begin
    InfoBox(TX_INACTIVE_CODE, TC_INACTIVE_CODE, MB_ICONWARNING or MB_OK);
    ProvDx.CodeInactive := True;
   end;
  QuickCopy(OldRec.RequestReason, memReason);
  memComment.Clear ;
  btnCmtCancel.Enabled := (OldRec.DenyComments.Count > 0);
  btnCmtOther.Enabled := (OldRec.OtherComments.Count > 0);
  txtAttn.InitLongList(OldRec.AttnName) ;
  if OldRec.Attention > 0 then
    txtAttn.SelectByIEN(OldRec.Attention)
  else
    txtAttn.ItemIndex := -1;
  SetProvDiagPromptingMode;
  FChanging := False;
  StatusText('');
end;

procedure TfrmEditCslt.Validate(var AnErrMsg: string);

  procedure SetError(const x: string);
  begin
    if Length(AnErrMsg) > 0 then AnErrMsg := AnErrMsg + CRLF;
    AnErrMsg := AnErrMsg + x;
  end;

begin
  inherited;
  if cboService.ItemIEN = 0               then SetError(TX_NO_SVC);
  if cboUrgency.ItemIEN = 0 then SetError(TX_NO_URGENCY);
  if cboPlace.ItemID = '' then SetError(TX_NO_PLACE);
  if memReason.Lines.Count = 0            then SetError(TX_NO_REASON);
  with cboService do
    begin
      if Piece(Items[ItemIndex], U, 5) = '1' then SetError(TX_NOTTHISSVC_TEXT);
      if (Piece(Items[ItemIndex],U,5) <> '1')
         and (Piece(Items[ItemIndex], U, 6) = '')
                                              then SetError(TX_SVC_ERROR) ;
    end;
  if (ProvDx.Reqd = 'R') and (Length(txtProvDiag.Text) = 0) then
    begin
      if ProvDx.PromptMode = 'F' then
        SetError(TX_NO_DIAG)
      else
        SetError(TX_SELECT_DIAG);
    end;
  if OldRec.ProvDxCodeInactive and ProvDx.CodeInactive then
    SetError(TX_INACTIVE_CODE);
end;

procedure TfrmEditCslt.txtAttnNeedData(Sender: TObject;
  const StartFrom: string; Direction, InsertAt: Integer);
begin
  inherited;
  txtAttn.ForDataUse(SubSetOfPersons(StartFrom, Direction));
end;

procedure TfrmEditCslt.radInpatientClick(Sender: TObject);
begin
  inherited;
  cboUrgency.Items.Clear;
  cboPlace.Items.Clear;
  cboCategory.Items.Clear;
  cboCategory.Items.Add('I^Inpatient');
  cboCategory.SelectById('I');
  ExtractItems(cboPlace.Items, Defaults, 'Inpt Place');
  ExtractItems(cboUrgency.Items, Defaults, 'Inpt Cslt Urgencies');      //S.GMRCR
  ControlChange(Self);
end;

procedure TfrmEditCslt.radOutpatientClick(Sender: TObject);
begin
  inherited;
  cboUrgency.Items.Clear;
  cboPlace.Items.Clear;
  cboCategory.Items.Clear;
  cboCategory.Items.Add('O^Outpatient');
  cboCategory.SelectById('O');
  ExtractItems(cboPlace.Items, Defaults, 'Outpt Place');
  ExtractItems(cboUrgency.Items, Defaults, 'Outpt Urgencies');     //S.GMRCO
  ControlChange(Self);
end;


procedure TfrmEditCslt.ControlChange(Sender: TObject);
begin
  if FChanging then exit;
  with NewRec do
    begin
      with cboService do if ItemIEN > 0 then
        if ItemIEN <> OldRec.ToService then
          begin
            ToService     := ItemIEN;
            ToServiceName := Text;
          end
        else
          begin
            ToService     := 0;
            ToServiceName := '';
          end;

     with cboCategory do if Length(ItemID) > 0 then
       if ItemID <> OldRec.InpOutP then
         InpOutP := ItemID
       else
         InpOutP := '';

     with cboUrgency do if ItemIEN > 0 then
       if StrToIntDef(Piece(Items[ItemIndex], U, 3), 0) <> OldRec.Urgency then
         begin
           Urgency     := StrToIntDef(Piece(Items[ItemIndex], U, 3), 0);
           UrgencyName := Text;
         end
       else
         begin
           Urgency     := 0;
           UrgencyName := '';
         end;

     with cboPlace do if Length(ItemID) > 0 then
       if ItemID <> OldRec.Place then
         begin
           Place     := ItemID;
           PlaceName := Text;
         end
       else
         begin
           Place     := '';
           PlaceName := '';
         end;

     with txtAttn do
       if ItemIEN > 0 then
         begin
           if ItemIEN <> OldRec.Attention then
             begin
               Attention := ItemIEN;
               AttnName  := Text;
             end
           else
             begin
               Attention := 0;
               AttnName  := '';
             end;
         end
       else  // blank
         begin
           if OldRec.Attention > 0 then
             begin
               Attention := -1;
               AttnName  := '';
             end
           else
             begin
               Attention := 0;
               AttnName  := '';
             end;
         end;

     with txtProvDiag do
       if Length(Text) > 0 then
         begin
           if Text <> OldRec.ProvDiagnosis then
             ProvDiagnosis := Text
           else
             ProvDiagnosis := '';

           if ProvDx.Code <> OldRec.ProvDxCode then
             ProvDxCode := ProvDx.Code
           else
             ProvDxCode := '';

           if OldRec.ProvDxCodeInactive then
             ProvDx.CodeInactive := (ProvDx.Code = OldRec.ProvDxCode);
         end
       else  //blank
         begin
           ProvDx.Code := '';
           ProvDx.CodeInactive := False;
           if OldRec.ProvDiagnosis <> '' then
             ProvDiagnosis := '@'
           else
             ProvDiagnosis := '';
         end;

     with memReason do if Lines.Count > 0 then
        if Lines.Equals(OldRec.RequestReason) then
          RequestReason.Clear
        else
          QuickCopy(memReason, RequestReason);

      with memComment do
        if GetTextLen > 0 then
          QuickCopy(memComment, NewComments)
        else
          NewComments.Clear;
    end;
end;

procedure TfrmEditCslt.FormClose(Sender: TObject; var Action: TCloseAction);
const
  TX_ACCEPT = 'Resubmit this request?' + CRLF + CRLF;
  TX_ACCEPT_CAP = 'Unsaved Changes';
begin
  if FChanged then
    if InfoBox(TX_ACCEPT, TX_ACCEPT_CAP, MB_YESNO) = ID_YES then
      if not ValidSave then Action := caNone;
end;

procedure TfrmEditCslt.cmdAcceptClick(Sender: TObject);
{Begin BillingAware}
var
  BADiagnosis: string;
  //newDxRec: TBADxRecord;
  //AnOrder: TOrder;
{End BillingAware}
begin

{Begin BillingAware}
  if  BILLING_AWARE then
  begin
     if BADxUpdated then
     begin
        BADiagnosis := ProvDx.Text + '^' + ProvDx.Code;
        UBAGlobals.Dx1 := BADiagnosis;  //  add selected dx to BA Dx List.
        UBAGlobals.SimpleAddTempDxList(UBAGlobals.BAOrderID);
     end;
  end;
{End BillingAware}

  if ValidSave then
    begin
      FChanged := (ResubmitConsult(NewRec) = '0');
      Close;
    end;
end;

procedure TfrmEditCslt.memReasonExit(Sender: TObject);
var
  AStringList: TStringList;
begin
  inherited;
  AStringList := TStringList.Create;
  try
    //QuickCopy(memReason, AStringList);
    AStringList.Text := memReason.Text;
    LimitStringLength(AStringList, 74);
    //QuickCopy(AstringList, memReason);
    memReason.Text := AStringList.Text;
    ControlChange(Self);
  finally
    AStringList.Free;
  end;
end;

procedure TfrmEditCslt.cmdQuitClick(Sender: TObject);
begin
  inherited;
  FChanged := False;
  Close;
end;

function TfrmEditCslt.ValidSave: Boolean;
const
  TX_NO_SAVE     = 'This request cannot be saved for the following reason(s):' + CRLF + CRLF;
  TX_NO_SAVE_CAP = 'Unable to Save Request';
  TX_SAVE_ERR    = 'Unexpected error - it was not possible to save this request.';
var
  ErrMsg: string;
begin
  Result := True;
  Validate(ErrMsg);
  if Length(ErrMsg) > 0 then
  begin
    InfoBox(TX_NO_SAVE + ErrMsg, TX_NO_SAVE_CAP, MB_OK);
    Result := False;
  end;
  if (ProvDx.Reqd = 'R') and (Length(txtProvDiag.Text) = 0) and (ProvDx.PromptMode = 'L') then
    cmdLexSearchClick(Self);
end;


procedure TfrmEditCslt.OrderMessage(const AMessage: string);
begin
  memMessage.Lines.SetText(PChar(AMessage));
  if ContainsVisibleChar(AMessage) then
  begin
    pnlMessage.Visible := True;
    pnlMessage.BringToFront;
    uMessageVisible := GetTickCount;
  end
  else pnlMessage.Visible := False;
end;

procedure TfrmEditCslt.btnCmtCancelClick(Sender: TObject);
begin
  ReportBox(OldRec.DenyComments, 'Cancellation Comments', False);
end;

procedure TfrmEditCslt.btnCmtOtherClick(Sender: TObject);
begin
  ReportBox(OldRec.OtherComments, 'Added Comments', False);
end;

procedure TfrmEditCslt.cmdLexSearchClick(Sender: TObject);
var
  Match: string;
  i: integer;
begin
  inherited;
{Begin BillingAware}
  if  BILLING_AWARE then BADxUpdated := FALSE;
{End BillingAware}
  LexiconLookup(Match, LX_ICD);
  if Match = '' then Exit;
  ProvDx.Code := Piece(Match, U, 1);
  ProvDx.Text := Piece(Match, U, 2);
  i := Pos(' (ICD', ProvDx.Text);
  if i = 0 then i := Length(ProvDx.Text) + 1;
  if ProvDx.Text[i-1] = '*' then i := i - 2;
  ProvDx.Text := Copy(ProvDx.Text, 1, i - 1);
  txtProvDiag.Text := ProvDx.Text + ' (' + ProvDx.Code + ')';
{Begin BillingAware}
  if  BILLING_AWARE then BADxUpdated := TRUE;
{End BillingAware}
  ProvDx.CodeInactive := False;
end;

procedure TfrmEditCslt.SetProvDiagPromptingMode;
const
  TX_USE_LEXICON = 'You must use the "Lexicon" button to select a provisional diagnosis for this service.';
  TX_PROVDX_OPT  = 'Provisional Diagnosis';
  TX_PROVDX_REQD = 'Provisional Dx (REQUIRED)';
begin
  cmdLexSearch.Enabled   := False;
  txtProvDiag.Enabled    := False;
  txtProvDiag.ReadOnly   := True;
  txtProvDiag.Color      := clBtnFace;
  txtProvDiag.Font.Color := clBtnText;
  lblProvDiag.Enabled    := False;
  txtProvDiag.Hint       := '';
  if cboService.ItemIEN = 0 then Exit;
  GetProvDxMode(ProvDx, cboService.ItemID + CSLT_PTR);
  //  Returns:  string  A^B
  //     A = O (optional), R (required) or S (suppress)
  //     B = F (free-text) or L (lexicon)
  with ProvDx do if (Reqd = '') or (PromptMode = '') then Exit;
  if ProvDx.Reqd = 'R' then
    lblProvDiag.Caption := TX_PROVDX_REQD
  else
    lblProvDiag.Caption := TX_PROVDX_OPT;
  if ProvDx.Reqd = 'S' then
    begin
      cmdLexSearch.Enabled   := False;
      txtProvDiag.Enabled    := False;
      txtProvDiag.ReadOnly   := True;
      txtProvDiag.Color      := clBtnFace;
      txtProvDiag.Font.Color := clBtnText;
      lblProvDiag.Enabled    := False;
    end
  else
    case ProvDx.PromptMode[1] of
      'F':  begin
              cmdLexSearch.Enabled   := False;
              txtProvDiag.Enabled    := True;
              txtProvDiag.ReadOnly   := False;
              txtProvDiag.Color      := clWindow;
              txtProvDiag.Font.Color := clWindowText;
              lblProvDiag.Enabled    := True;
            end;
      'L':  begin
              cmdLexSearch.Enabled   := True;
              txtProvDiag.Enabled    := True;
              txtProvDiag.ReadOnly   := True;
              txtProvDiag.Color      := clInfoBk;
              txtProvDiag.Font.Color := clInfoText;
              lblProvDiag.Enabled    := True;
              txtProvDiag.Hint       := TX_USE_LEXICON;
            end;
    end;
end;

procedure TfrmEditCslt.mnuPopProvDxDeleteClick(Sender: TObject);
begin
  inherited;
  ProvDx.Text := '';
  ProvDx.Code := '';
  ProvDx.CodeInactive := False;
  txtProvDiag.Text := '';
  ControlChange(Self);
end;

procedure TfrmEditCslt.popReasonPopup(Sender: TObject);
begin
  inherited;
  if PopupComponent(Sender, popReason) is TCustomEdit
    then FEditCtrl := TCustomEdit(PopupComponent(Sender, popReason))
    else FEditCtrl := nil;
  if FEditCtrl <> nil then
  begin
    popReasonCut.Enabled      := FEditCtrl.SelLength > 0;
    popReasonCopy.Enabled     := popReasonCut.Enabled;
    popReasonPaste.Enabled    := (not TORExposedCustomEdit(FEditCtrl).ReadOnly) and
                                   Clipboard.HasFormat(CF_TEXT);
  end else
  begin
    popReasonCut.Enabled      := False;
    popReasonCopy.Enabled     := False;
    popReasonPaste.Enabled    := False;
  end;
  popReasonReformat.Enabled := True;
end;

procedure TfrmEditCslt.popReasonCutClick(Sender: TObject);
begin
  inherited;
  FEditCtrl.CutToClipboard;
end;

procedure TfrmEditCslt.popReasonCopyClick(Sender: TObject);
begin
  inherited;
  FEditCtrl.CopyToClipboard;
end;

procedure TfrmEditCslt.popReasonPasteClick(Sender: TObject);
begin
  inherited;
  FEditCtrl.SelText := Clipboard.AsText;
end;

procedure TfrmEditCslt.popReasonReformatClick(Sender: TObject);
begin
  inherited;
  if (Screen.ActiveControl <> memReason) and
     (Screen.ActiveControl <> memComment)then Exit;
  ReformatMemoParagraph(TCustomMemo(FEditCtrl));
end;

procedure TfrmEditCslt.memCommentKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FNavigatingTab then
  begin
    if ssShift in Shift then
      FindNextControl(Sender as TWinControl, False, True, False).SetFocus //previous control
    else if ssCtrl	in Shift then
      FindNextControl(Sender as TWinControl, True, True, False).SetFocus; //next control
    FNavigatingTab := False;
  end;
  if (key = VK_ESCAPE) then begin
    FindNextControl(Sender as TWinControl, False, True, False).SetFocus; //previous control
    key := 0;
  end;
end;

procedure TfrmEditCslt.memCommentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //The navigating tab controls were inadvertantently adding tab characters
  //This should fix it
  FNavigatingTab := (Key = VK_TAB) and ([ssShift,ssCtrl] * Shift <> []);
  if FNavigatingTab then
    Key := 0;
end;

procedure TfrmEditCslt.memCommentKeyPress(Sender: TObject; var Key: Char);
begin
  if FNavigatingTab then
    Key := #0;  //Disable shift-tab processin
end;

end.
