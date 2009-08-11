unit fODBBank;
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ORCtrls, ORfn, fODBase, ExtCtrls, ComCtrls, uConst,
  ORDtTm, Buttons, Menus, ImgList, VA508AccessibilityManager, VAUtils;

type
  TfrmODBBank = class(TfrmODBase)
    dlgLabCollTime: TORDateTimeDlg;
    ORWanted: TORDateTimeDlg;
    pnlComments: TPanel;
    btnUpdateComments: TButton;
    btnCancelComment: TButton;
    lblOrdComment: TLabel;
    pgeProduct: TPageControl;
    TabInfo: TTabSheet;
    edtInfo: TCaptionRichEdit;
    TabDiag: TTabSheet;
    lblReqComment: TOROffsetLabel;
    TabResults: TTabSheet;
    edtResults: TCaptionRichEdit;
    pnlFields: TPanel;
    lblDiagComment: TOROffsetLabel;
    lblUrgency: TLabel;
    lblReason: TLabel;
    lblSurgery: TLabel;
    cboUrgency: TORComboBox;
    chkConsent: TCheckBox;
    cboSurgery: TORComboBox;
    pnlSelect: TPanel;
    pnlDiagnosticTests: TGroupBox;
    cboAvailTest: TORComboBox;
    pnlBloodComponents: TGroupBox;
    lblQuantity: TLabel;
    lblModifiers: TLabel;
    cboAvailComp: TORComboBox;
    tQuantity: TEdit;
    cboModifiers: TORComboBox;
    GroupBox1: TGroupBox;
    cboQuick: TORComboBox;
    pnlSelectedTests: TGroupBox;
    lvSelectionList: TCaptionListView;
    btnRemove: TButton;
    btnRemoveAll: TButton;
    cboReasons: TORComboBox;
    lblRequiredField: TLabel;
    memDiagComment: TRichEdit;
    lblCollType: TLabel;
    cboCollType: TORComboBox;
    lblCollTime: TLabel;
    cboCollTime: TORComboBox;
    calWantTime: TORDateBox;
    lblWanted: TLabel;
    calCollTime: TORDateBox;
    txtImmedColl: TCaptionEdit;
    pnlCollTimeButton: TKeyClickPanel;
    cmdImmedColl: TSpeedButton;
    lblTNS: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cboAvailTestSelect(Sender: TObject);
    procedure cboAvailCompSelect(Sender: TObject);
    procedure DisableCommentPanels;
    procedure DisableComponentControls;
    procedure DisableDiagTestControls;
    procedure EnableComponentControls;
    procedure EnableDiagTestControls;
    procedure cboAvailTestExit(Sender: TObject);
    procedure cboAvailCompExit(Sender: TObject);
    procedure cboAvailTestNeedData(Sender: TObject;
      const StartFrom: String; Direction, InsertAt: Integer);
    procedure cboAvailCompNeedData(Sender: TObject;
      const StartFrom: String; Direction, InsertAt: Integer);
    procedure cmdImmedCollClick(Sender: TObject);
    procedure pgeProductChange(Sender: TObject);
    procedure cboCollTypeChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnRemoveAllClick(Sender: TObject);
    procedure cmdAcceptClick(Sender: TObject);
    procedure calWantTimeChange(Sender: TObject);
    procedure chkConsentClick(Sender: TObject);
    procedure cboUrgencyChange(Sender: TObject);
    procedure cboSurgeryChange(Sender: TObject);
    procedure calCollTimeChange(Sender: TObject);
    procedure cboQuickClick(Sender: TObject);
    procedure tQuantityEnter(Sender: TObject);
    procedure btnUpdateCommentsClick(Sender: TObject);
    procedure btnCancelCommentClick(Sender: TObject);
    procedure cboSurgeryClick(Sender: TObject);
    procedure cboReasonsEnter(Sender: TObject);
    procedure cboReasonsExit(Sender: TObject);
    procedure tQuantityClick(Sender: TObject);
    procedure tQuantityChange(Sender: TObject);
    procedure cboReasonsChange(Sender: TObject);
    procedure cboModifiersChange(Sender: TObject);
    procedure lvSelectionListClick(Sender: TObject);
    procedure cboAvailCompChange(Sender: TObject);
    procedure cboCollTimeChange(Sender: TObject);
    procedure memDiagCommentChange(Sender: TObject);
    procedure cboUrgencyExit(Sender: TObject);
  protected
    FCmtTypes: TStringList ;
    procedure InitDialog; override;
    function  ValidCollTime(UserEntry: string): string;
    procedure GetAllCollSamples(AComboBox: TORComboBox);
    procedure GetAllSpecimens(AComboBox: TORComboBox);
    procedure SetupCollTimes(CollType: string);
    procedure LoadCollType(AComboBox:TORComboBox);
    function  ValidAdd: Boolean;
    procedure ValidateAdd(var AnErrMsg: string);
    procedure Validate(var AnErrMsg: string); override;
    procedure ExtractMSBOS(OutList:TStrings; AList:TStrings);
    procedure ExtractTests(OutList:TStrings; AList:TStrings);
    procedure ExtractSurgeries(OutList:TStrings; AList:TStrings);
    procedure ExtractUrgencies(OutList:TStrings; AList:TStrings);
    procedure ExtractTNSOrders(OutList:TStrings; AList:TStrings);
    procedure ExtractModifiers(OutList:TStrings; AList:TStrings);
    procedure ExtractReasons(OutList:TStrings; AList:TStrings);
    procedure ExtractSpecimens(OutList:TStrings; AList:TStrings);
    procedure ExtractTypeScreen(OutList:TStrings; AList:TStrings);
    procedure ExtractOther(OutList:TStrings; AList:TStrings);
    procedure ExtractPatientInfo(OutList:TStrings; AList:TStrings);
    procedure ExtractSpecimen(OutList:TStrings; AList:TStrings);
    function  SpecimenNeeded(OutList:TStrings; AList:TStrings; CompID:integer): Boolean;
    procedure LoadUrgencies(AComboBox:TORComboBox);
    procedure LoadModifiers(AComboBox:TORComboBox);
    procedure LoadReasons(AComboBox:TORComboBox);

  private
    FLastCollType: string;
    FLastCollTime: string;
    FLastLabCollTime: string;
    FLastLabID: string;
    FLastItemID: string;
    FEvtDelayLoc: integer;
    FEvtDivision: integer;
    FVbecLookup: string;
    FQuickList:  Integer;
    FQuickItems: TStringList;
    FOrderAction: Integer;
    procedure ReadServerVariables;
    procedure SetOnQuickOrder;
  public
    procedure SetupDialog(OrderAction: Integer; const ID: string); override;
    procedure LoadRequiredComment(CmtType: integer);
    procedure DetermineCollectionDefaults(Responses: TResponses);
    property  EvtDelayLoc: integer   read FEvtDelayLoc   write FEvtDelayLoc;
    property  EvtDivision: integer   read FEvtDivision   write FEvtDivision;
  end;

type
  TCollSamp = class(TObject)
    CollSampID: Integer;                  { IEN of CollSamp }
    CollSampName: string;                 { Name of CollSamp }
    SpecimenID: Integer;                  { IEN of default specimen }
    SpecimenName: string;                 { Name of the specimen }
    TubeColor: string;                    { TubeColor (text) }
    MinInterval: Integer;                 { Minimum days between orders }
    MaxPerDay: Integer;                   { Maximum orders per day }
    LabCanCollect: Boolean;               { True if lab can collect }
    SampReqComment: string;               { Name of required comment }
    WardComment: TStringList;             { CollSamp specific comment }
  end;

  TLabTest = class(TObject)
    TestID: Integer;                      { IEN of Lab Test }
    TestName: string;                     { Name of Lab Test }
    ItemID: Integer;                      { Orderable Item ID }
    LabSubscript: string ;                { which section of Lab? }
    CollSamp: Integer;                    { index into CollSampList }
    Specimen: Integer;                    { IEN of specimen }
    Urgency: Integer;                     { IEN of urgency }
    Comment: TStringList;                 { text of comment }
    TestReqComment: string;               { Name of required comment }
    CurReqComment: string;                { name of required comment }
    CurWardComment: TStringList;          { WP of Ward Comment }
    UniqueCollSamp: Boolean;              { true if not prompt CollSamp }
    CollSampList: TList;                  { collection sample objects }
    CollSampCount: integer;               { count of original contents of CollSampList}
    SpecimenList: TStringList;            { Strings: IEN^Specimen Name }
    SpecListCount: integer;               { count of original contents of SpecimenList}
    UrgencyList: TStringList;             { Strings: IEN^Urgency Name }
    ForceUrgency: Boolean;                { true if not prompt Urgency }
    SurgeryList: TStringList;             { Strings: Surgeries}
    PatientInfo: TStringList;             { Text of Patient Information}
    ResultsDisplay: TStringList;          { Text of Test Results}
    QuickOrderResponses: TResponses;      { if created as a result of a quick order selection}
    { functions & procedures }
    constructor Create(const LabTestIEN: string; Responses: TResponses);
    destructor Destroy; override ;
    function  IndexOfCollSamp(CollSampIEN: Integer): Integer;
    procedure FillCollSampList(LoadData: TStringList; DfltCollSamp: Integer);
    procedure LoadAllSamples;
    procedure SetCollSampDflts;
    procedure ChangeCollSamp(CollSampIEN: Integer);
    procedure ChangeSpecimen(const SpecimenIEN: string);
    procedure ChangeComment(const CommentText: string);
    function  LabCanCollect: Boolean;
    procedure LoadCollSamp(AComboBox: TORComboBox);
    procedure LoadSpecimen(AComboBox: TORComboBox);
    procedure LoadUrgency(CollType: string; AComboBox:TORComboBox);
    function  NameOfCollSamp: string;
    function  NameOfSpecimen: string;
    function  NameOfUrgency: string;
    function  ObtainCollSamp: Boolean;
    function  ObtainSpecimen: Boolean;
    function  ObtainUrgency: Boolean;
    function  ObtainComment: Boolean;

  end;

const
  CmtType: array[0..6] of string = ('ANTICOAGULATION','DOSE/DRAW TIMES','ORDER COMMENT',
                                    'ORDER COMMENT MODIFIED','TDM (PEAK-TROUGH)',
                                    'TRANSFUSION','URINE VOLUME');
var
  frmODBBank: TfrmODBBank;

implementation

{$R *.dfm}

uses rODBase, rODLab, uCore, rCore, fODLabOthCollSamp, fODLabOthSpec, fODLabImmedColl, fLabCollTimes,
 rOrders, uODBase, fRptBox;

var
  uSelectedItems: TStringList;   //Selected Items in ListView- if TestYes =1 then test else component
                                 //TestYes(1)^Test-Component(2)^Qty(3)^Modifier(4)^Specimen(5,6)^CollTime(7)^CollType(8)
  uVBECList: TStringList;        //List of items from VBEC api
  uTestsForResults: TStringList; //List of tests to show results
  uUrgencyList: TStringList;     //List of Urgencies
  uTNSOrders: TStringList;       //List of Current orders for Type & Screen
  uModifierList: TStringList;    //List of Modifiers
  uReasonsList: TStringList;     //List of Reasons for Request
  uRaw: TStringList;             //Results Array
  uTestSelected, uComponentSelected: Boolean;  //Used on Validate
  uDfltUrgency: Integer;         //Default Urgency
  uSelUrgency: String;          //Previously Selected Urgency - Used when components have been added for specific urgency
  uSelSurgery: Integer;          //Selected Surgery for Blood order
  uSpecimen, uGetTnS: Integer;            //Set to 1 if a specimen for test is already in lab... no need to collect
  uDfltCollType, uReason: string;
  ALabTest: TLabTest;
  UserHasLRLABKey: boolean;
  LRFZX     : string;  //the default collection type  (LC,WC,SP,I)
  LRFSAMP   : string;  //the default sample           (ptr)
  LRFSPEC   : string;  //the default specimen         (ptr)
  LRFDATE   : string;  //the default collection time  (NOW,NEXT,AM,PM,T...)
  LRFURG    : string;  //the default urgency          (number)		TRY '2'
  LRFSCH    : string;  //the default schedule?        (ONE TIME, QD, ...)
  LRORDERMODE : Integer; //the mode being used to order (component or diagnostic test)

const
  TX_NO_TEST          = 'A Lab Test must be specified.'    ;
  TX_NO_IMMED = 'Immediate collect is not available for this test/sample';
  TX_NO_IMMED_CAP = 'Invalid Collection Type';

  TI_INFO = 0;    //Corresponds with pgeProduct TabIndex
  TI_COMPONENT = 1;
  TI_RESULTS = 2;

  TORDER_MODE_INFO = 0;
  TORDER_MODE_DIAG = 1;
  TORDER_MODE_COMP = 2;

procedure TfrmODBBank.FormCreate(Sender: TObject);
var
  i: integer;
  AList, ATests: TStringList;
  ListCount: Integer;
  x: string;
begin
  AutoSizeDisabled := True;
  inherited;
  AList := TStringList.Create;
  ATests := TStringList.Create;
  uSelectedItems := TStringList.Create;
  uVBECList := TStringList.Create;
  uTestsForResults := TStringList.Create;
  uUrgencyList := TStringList.Create;
  uTNSOrders := TStringList.Create;
  uModifierList := TStringList.Create;
  uReasonsList := TStringList.Create;
  uRaw := TStringList.Create;
  uSpecimen := 0;
  uGetTnS := 0;
  uReason := '';
  lblTNS.Caption := '';
  lblTNS.Visible := false;
  pnlMessage.Visible := false;
  uDfltUrgency := 9;
  uSelUrgency := '';
  uSelSurgery := 0;
  TabResults.Caption := 'Lab Results';
  edtResults.Lines.Clear;
  edtResults.Lines.Add('Lab results are ONLY available after selecting/adding a component on the Blood Bank Orders tab that has been designated for results retrieval.');
  Responses.Clear;
  try
    LRFZX    := '';
    LRFSAMP  := '';
    LRFSPEC  := '';
    LRFDATE  := '';
    LRFURG   := '';
    LRFSCH   := '';
    LRORDERMODE := TORDER_MODE_INFO;
    FLastColltime := '';
    FLastLabCollTime := '';
    FLastItemID := '';
    uDfltCollType := '';
    FillerID := 'LR';
    FEvtDelayLoc := 0;
    FEvtDivision := 0;
    UserHasLRLABKey := User.HasKey('LRLAB');
    AllowQuickOrder := True;
    StatusText('Loading Dialog Definition');
    FCmtTypes := TStringList.Create;
    for i := 0 to 6 do FCmtTypes.Add(CmtType[i]) ;
    Responses.Dialog := 'VBEC BLOOD BANK';        // loads formatting info
    StatusText('Loading Default Values');
    if Self.EvtID > 0 then
    begin
      EvtDelayLoc := StrToIntDef(GetEventLoc1(IntToStr(Self.EvtID)),0);
      EvtDivision := StrToIntDef(GetEventDiv1(IntToStr(Self.EvtID)),0);
      if EvtDelayLoc>0 then
        FastAssign(ODForLab(EvtDelayLoc,EvtDivision), AList)
      else
        FastAssign(ODForLab(Encounter.Location,EvtDivision), AList);
    end else
      FastAssign(ODForLab(Encounter.Location), AList); // ODForLab returns TStrings with defaults
    CtrlInits.LoadDefaults(AList);
    InitDialog;
    GroupBox1.Visible := True;
    with CtrlInits do
    begin
      SetControl(cboCollType, 'Collection Types');
      uDfltCollType := ExtractDefault(AList, 'Collection Types');
      if uDfltCollType <> '' then
        cboCollType.SelectByID(uDfltCollType)
      else if OrderForInpatient then
        cboCollType.SelectByID('LC')
      else
        cboCollType.SelectByID('SP');
      SetupCollTimes(cboCollType.ItemID);
      StatusText('Initializing List of Tests');
      FVbecLookup := 'S.VBT';
      cboAvailTest.InitLongList('');      //Populates cboAvailTest control based on S.VBT xref
    end;
    cboAvailComp.Clear;
    aList.Clear;
    GetBloodComponents(aList);            //Get Components in right order
    for i := 0 to aList.Count - 1 do
      cboAvailComp.Items.Add(aList[i]);
    uVBECList.Clear;
    edtInfo.Clear;
    cboSurgery.Clear;
    GetPatientBBInfo(uVBECList, Patient.DFN, Encounter.Location);
    aList.Clear;
    ExtractPatientInfo(AList, uVBECList);
    QuickCopy(AList, edtInfo);
    AList.Clear;
    ExtractSurgeries(AList, uVBECList);
    for i := 0 to AList.Count - 1 do
      cboSurgery.Items.Add(AList[i]);
    AList.Clear;
    ExtractUrgencies(uUrgencyList, uVBECList);
    ExtractTNSOrders(uTNSOrders, uVBECList);
    LoadUrgencies(cboUrgency);
    ExtractModifiers(uModifierList, uVBECList);
    ExtractReasons(uReasonsList, uVBECList);
    LoadModifiers(cboModifiers);
    LoadReasons(cboReasons);
    calWantTime.Text := 'NOW'; //FormatFMDateTime('mmm dd,yyyy@hh:nn',DateTimeToFMDateTime(Now));
    pgeProduct.TabIndex := TI_INFO;
    lvSelectionList.Column[0].Width := 240;
    lvSelectionList.Column[1].Width := 30;
    lvSelectionList.Column[2].Width := 100;
    DisableComponentControls;
    DisableDiagTestControls;
    pgeProduct.ActivePageIndex := TI_INFO;
    StatusText('');
    x := 'VBEC';
    FQuickItems := TStringList.Create;
    ListForQuickOrders(FQuickList, ListCount, x);
    if ListCount > 0 then
      begin
        SubsetOfQuickOrders(FQuickItems, FQuickList, 0, 0);
      end else
      begin
        ListCount := 1;
        FQuickItems.Add('0^(No quick orders available)');
      end;

    FastAssign(FQuickItems, cboQuick.Items);
    if lvSelectionList.Items.Count > 0 then
      begin
        memOrder.Visible := true;
        cmdAccept.Visible := true;
      end;
  finally
    AList.Free;
    ATests.Free;
  end;
end;

procedure TfrmODBBank.InitDialog;
begin
  inherited;
  Changing := True;
  if ALabTest <> nil then
    begin
      ALabTest.Destroy;
      ALabTest := nil;
    end;
  DisableCommentPanels;
  cboAvailTest.SelectByID(FLastItemID);
  cboAvailComp.SelectByID(FLastItemID);
  cboAvailTest.ItemIndex := -1;
  StatusText('');
  Changing := False ;
end;

procedure TfrmODBBank.SetupDialog(OrderAction: Integer; const ID: string);
var
  AnInstance, CurAdd: Integer;
  AResponse: TResponse;
  i, j, k, aTNS, aTNSDays, getTest, TestAdded: integer;
  aStr, aTestYes, aName, aTypeScreen, aSpecimen, aModifier, sub, sub1, x, aTNSString: string;
  ListItem: TListItem;
  aList: TStringList;
  aTests: TStringList;
begin
  inherited;
  aList := TStringList.Create;
  aTests:= TStringList.Create;
  try
  FOrderAction := OrderAction;
  ReadServerVariables;
  sub1 := '';
  aTypeScreen := '';
  aSpecimen := '^';
  aModifier := '';
  if OrderAction in [ORDER_COPY, ORDER_EDIT, ORDER_QUICK] then with Responses, ALabTest do
    begin
      AnInstance := NextInstance('ORDERABLE', 0);
      while AnInstance > 0 do
        begin
          AResponse := FindResponseByName('ORDERABLE', AnInstance);
          if AResponse <> nil then
            begin
              sub := GetSubtype(AResponse.EValue);
              if sub = 't' then
                begin
                  SetControl(cboAvailTest,        'ORDERABLE', AnInstance);
                  ALabTest := TLabTest.Create(cboAvailTest.ItemID, Responses);
                end
              else
                begin
                  SetControl(cboAvailComp,        'ORDERABLE', AnInstance);
                  ALabTest := TLabTest.Create(cboAvailComp.ItemID, Responses);
                end;
              if ALabTest = nil then Exit;  // Causes access violation
              if AnInstance = 1 then
                begin
                  SetControl(cboReasons,         'REASON' , AnInstance);
                  SetControl(calWantTime,        'DATETIME', AnInstance);
                  SetControl(memDiagComment,     'COMMENT', AnInstance);
                  SetControl(chkConsent,         'YN', AnInstance);
                  //DetermineCollectionDefaults(Responses);
                  SetControl(cboCollType,        'COLLECT', AnInstance);
                  SetControl(cboCollTime,        'START', AnInstance);
                  SetupCollTimes(cboCollType.ItemID);
                  SetControl(cboUrgency,         'URGENCY', AnInstance);
                  SetControl(cboSurgery,         'MISC', AnInstance);
                  Urgency := cboUrgency.ItemIEN;
                  if (Urgency = 0) and (cboUrgency.Items.Count = 1) then
                    begin
                      cboUrgency.ItemIndex := 0;
                      Urgency := cboUrgency.ItemIEN;
                    end;
                  i := 1 ;
                  AResponse := Responses.FindResponseByName('COMMENT',i);
                  while AResponse <> nil do
                    begin
                      Comment.Add(AResponse.EValue);
                      Inc(i);
                      AResponse := Responses.FindResponseByName('COMMENT',i);
                    end ;
                end;
              if sub = 't' then with ALabTest do      //DIAGNOSTIC TEST
                begin
                  Changing := True;
                  DisableComponentControls;
                  EnableDiagTestControls;
                  LRORDERMODE := TORDER_MODE_DIAG;
                  aList.Clear;
                  aTestYes := '1';
                  ExtractTypeScreen(aList, uVBECList);
                  if aList.Count > 0 then aTypeScreen := aList[0];
                  aList.Clear;
                  with lvSelectionList do
                    begin
                      ListItem := Items.Add;
                      ListItem.Caption := piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',2);
                      ListItem.SubItems.Add('');
                      ListItem.SubItems.Add('');
                      ListItem.SubItems.Add('');
                      ListItem.SubItems.Add(piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',1));
                      if piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',1) = aTypeScreen then
                        begin
                          lblTNS.Caption := '';
                          lblTNS.Visible := false;
                          memMessage.Text := '';
                          pnlMessage.Visible := false;
                          uGetTnS := 0;
                          pnlDiagnosticTests.Caption := 'Diagnostic Tests';
                        end;
                    end;
                  aStr := aTestYes + '^' + IntToStr(aLabTest.TestID) + '^' + tQuantity.Text + '^' + aModifier + '^' + aSpecimen + '^' + IntToStr(aLabTest.ItemID);  //aSpecimen has 2 pieces additional pieces added for Tests
                  uSelectedItems.Add(aStr);
                  if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
                  {with cboCollType do if Length(ItemID) > 0 then
                    begin
                      Responses.Update('COLLECT', 1, ItemID, ItemID) ;
                      FLastCollType := ItemID;
                    end;  }
                  if Length(cboUrgency.Text) > 0 then Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
                  if Length(memDiagComment.Text) > 0 then Responses.Update('COMMENT',1,memDiagComment.Text,memDiagComment.Text);
                  if Length(cboReasons.Text) > 0 then Responses.Update('REASON',1,cboReasons.Text,cboReasons.Text);
                  LoadCollType(cboCollType);
                  if (cboCollType.ItemID = 'LC') or (cboCollType.ItemID = 'I') then
                    if not(ALabTest.LabCanCollect) and OrderForInpatient then
                      cboCollType.SelectByID('WC')
                    else if not(ALabTest.LabCanCollect) then
                      cboCollType.SelectByID('SP');
                  SetupCollTimes(cboCollType.ItemID);
                  if cboCollType.ItemID = 'LC' then
                    begin
                      with cboCollTime do
                        if Length(ItemID) > 0 then
                          begin
                            Responses.Update('START', 1, Copy(ItemID, 2, 999), Copy(ItemID, 2, 999));
                            FLastLabCollTime := ItemID + U + Text;
                          end
                        else if Length(Text) > 0 then
                          begin
                            Responses.Update('START', 1, ValidCollTime(Text), Text) ;
                            FLastLabCollTime := ValidCollTime(Text);
                          end;
                    end
                  else
                    begin
                      with calCollTime do
                        if FMDateTime > 0 then
                          begin
                            Responses.Update('START', 1, ValidCollTime(Text), Text);
                            FLastColltime := ValidCollTime(Text);
                          end
                        else
                          begin
                            Responses.Update('START', 1, '', '') ;
                            FLastCollTime := '';
                          end;
                    end;
                  with cboCollType do if Length(ItemID) > 0 then
                    begin
                      Responses.Update('COLLECT', 1, ItemID, ItemID) ;
                      FLastCollType := ItemID;
                    end;
                  //if Length(cboCollType.Text) > 0 then Responses.Update('COLLECT',1,cboCollType.ItemID,cboCollType.ItemID);
                  memOrder.Text := Responses.OrderText;
                  Changing := False;
                  if ObtainCollSamp then
                    begin
                      //For BloodBank orders, this condition should never occur
                    end
                  else
                    begin
                      with ALabTest do
                        with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                          begin
                            x := '' ;
                            for i := 0 to WardComment.Count-1 do
                            x := x + WardComment.strings[i]+#13#10 ;
                            pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                            OrderMessage(x) ;
                          end ;
                    end;
                end;
              if sub = 'c' then with ALabTest do  //COMPONENT
                begin
                  Changing := True;
                  DisableDiagTestControls;
                  EnableComponentControls;
                  aTestYes := '0';
                  LRORDERMODE := TORDER_MODE_COMP;
                  SetControl(cboModifiers,       'MODIFIER', AnInstance);
                  SetControl(tQuantity,          'QTY', AnInstance);
                  uComponentSelected := true;
                  aList.Clear;
                  TestAdded := 0;
                  getTest := 0;
                  ExtractTests(aList, uVBECList);   //Get Results associated with ordered components
                    for j := 0 to aList.Count - 1 do
                      begin
                        if StrToInt(piece(aList[j],'^',1)) = aLabTest.ItemID then
                          begin
                            if uTestsForResults.Count < 1 then getTest := 1;
                            for k := 0 to uTestsForResults.Count - 1 do
                              begin
                                if piece(uTestsForResults[k],'^',1) = piece(aList[j],'^',3) then
                                  begin
                                    getTest := 0;
                                    break;
                                  end
                                else getTest := 1;
                              end;
                            if getTest = 1 then
                              begin
                                uTestsForResults.Add(piece(aList[j],'^',3));
                                TestAdded := 1;
                              end;
                          end;
                      end;
                    if TestAdded = 1 then
                      begin
                        edtResults.Clear;
                        aTests.Clear;
                        GetPatientBloodResults(aTests, Patient.DFN, uTestsForResults);
                        QuickCopy(ATests,edtResults);
                        if edtResults.Lines.Count > 0 then TabResults.Caption := 'Lab Results Available'; //TabResults.ImageIndex := 1;
                        uRaw.Clear;
                        GetPatientBloodResultsRaw(uRaw, Patient.DFN, uTestsForResults);
                      end;
                    CurAdd := 1;
                    if uRaw.Count > 0 then
                    for j := 0 to uRaw.Count - 1 do
                      begin
                        if Length(uRaw[j]) > 0 then Responses.Update('RESULTS', CurAdd, uRaw[j], piece(uRaw[j],'^',1));
                        Inc(CurAdd);
                      end;
                  with lvSelectionList do
                    begin
                      ListItem := Items.Add;
                      ListItem.Caption := piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',2);
                      ListItem.SubItems.Add(tQuantity.Text);
                      if length(cboModifiers.ItemID) > 0 then
                        begin
                          ListItem.SubItems.Add(cboModifiers.Items[cboModifiers.ItemIndex]);
                          ListItem.SubItems.Add(IntToStr(cboModifiers.ItemIndex));
                        end
                        else
                          begin
                            ListItem.SubItems.Add('');
                            ListItem.SubItems.Add('');
                          end;
                      ListItem.SubItems.Add(piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',1));
                    end;
                  aStr := aTestYes + '^' + IntToStr(aLabTest.TestID) + '^' + tQuantity.Text + '^' + aModifier + '^' + aSpecimen + '^' + IntToStr(aLabTest.ItemID);  //aSpecimen has 2 pieces additional pieces added for Tests
                  uSelectedItems.Add(aStr);
                  memOrder.Text := Responses.OrderText;
                  Changing := False;
                end;
            end;
          StatusText('');
          AnInstance := NextInstance('ORDERABLE', AnInstance);
        end;  //while AnInstance - ORDERABLE
      DisableComponentControls;
      DisableDiagTestControls;
    end;
    CurAdd := 1;
    for i := 0 to uSelectedItems.Count - 1 do
      begin
        aName := lvSelectionList.Items[i].Caption;
        x := uSelectedItems[i];
        if piece(x,'^',1) = '1' then    //Diagnostic Test related fields
          begin
            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
          end
        else
          begin
            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
            if Length(piece(x,'^',3)) > 0 then Responses.Update('QTY', CurAdd, piece(x,'^',3), piece(x,'^',3));
            if Length(piece(x,'^',4)) > 0 then Responses.Update('MODIFIER', CurAdd, piece(x,'^',4), piece(x,'^',4));
            if Length(piece(x,'^',5)) > 0 then Responses.Update('SPECSTS', CurAdd, pieces(x,'^',5,7), piece(x,'^',5));
            if Length(cboSurgery.Text) > 0 then Responses.Update('MISC',1,cboSurgery.Text,cboSurgery.Text);
            if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
            if Length(cboUrgency.Text) > 0 then Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text)
              else
                begin
                  cboUrgency.ItemIndex := 1;
                  Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
                  cboUrgencyChange(self);
                end;
          end;
        Inc(CurAdd);
      end;
    for i := 0 to lvSelectionList.Items.Count - 1 do
      begin
        if lvSelectionList.Items[i].SubItems[3] = aTypeScreen then
          begin
            if uTNSOrders.Count > 0 then
              begin
                for j := 0 to uTNSOrders.Count - 1 do
                  aTNSString := aTNSString + CRLF + uTNSOrders[j];
                with Application do
                  begin
                    NormalizeTopMosts;
                    aTNSDays := TNSDaysBack;
                    aTNS :=
                      MessageBox(PChar(aTNSString + CRLF + CRLF +
                                 'Do you wish to continue with this request for Type & Screen?'),
                                 PChar('Type & Screen Entered in Past ' + IntToStr(TNSDaysBack) + ' Days'),
                                 MB_YESNO);
                    RestoreTopMosts;
                    if aTNS = 7 then
                      begin
                        lvSelectionList.ItemIndex := i;
                        lvSelectionListClick(self);
                        btnRemoveClick(self);
                        break;
                      end;
                  end;
              end;
            break;
          end;
      end;
  {if OrderAction in [ORDER_COPY, ORDER_EDIT, ORDER_QUICK] then with Responses, ALabTest do
    begin
      if OrderAction in [ORDER_QUICK, ORDER_EDIT] then uQuickInProcess := 1;
      AnInstance := NextInstance('ORDERABLE', 0);
      while AnInstance > 0 do
        begin
          AResponse := FindResponseByName('ORDERABLE', AnInstance);
          if AResponse <> nil then
            begin
              sub := GetSubtype(AResponse.EValue);
              if sub = 't' then
                begin
                  SetControl(cboAvailTest,        'ORDERABLE', AnInstance);
                  ALabTest := TLabTest.Create(cboAvailTest.ItemID, Responses);
                end
              else
                begin
                  SetControl(cboAvailComp,        'ORDERABLE', AnInstance);
                  ALabTest := TLabTest.Create(cboAvailComp.ItemID, Responses);
                end;
              //SetControl(cboTests,           'ORDERABLE', AnInstance);
              //ALabTest := TLabTest.Create(cboTests.ItemID, Responses);
              if ALabTest = nil then Exit;  // Causes access violation
              //sub := GetSubtype(ALabTest.TestName);
              if AnInstance = 1 then
                begin
                  DetermineCollectionDefaults(Responses);
                  SetControl(cboReasons,         'REASON', AnInstance);
                  SetControl(chkConsent,         'YN', AnInstance);
                  SetControl(cboSurgery,         'MISC', AnInstance);
                  //SetControl(cboCollType,        'COLLECT', AnInstance);
                  //SetControl(cboCollTime,        'START', AnInstance);
                  SetControl(calWantTime,        'DATETIME', AnInstance);
                  //LoadUrgency(cboCollType.ItemID, cboUrgency);
                  SetControl(cboUrgency,         'URGENCY', AnInstance);
                  Urgency := cboUrgency.ItemIEN;
                  if (Urgency = 0) and (cboUrgency.Items.Count = AnInstance) then
                    begin
                      cboUrgency.ItemIndex := 0;
                      Urgency := cboUrgency.ItemIEN;
                    end;
                  i := 1 ;
                  AResponse := Responses.FindResponseByName('COMMENT',i);
                  while AResponse <> nil do
                      begin
                        if Length(AResponse.Evalue) > 0 then
                          Comment.Add(AResponse.EValue);
                        Inc(i);
                        AResponse := Responses.FindResponseByName('COMMENT',i);
                      end ;
                end;
              if sub = 't' then with ALabTest do      //DIAGNOSTIC TEST
                begin
                  Changing := True;
                  DisableComponentControls;
                  EnableDiagTestControls;
                  LRORDERMODE := TORDER_MODE_DIAG;
                  with Responses do
                    begin
                      StatusText('Initializing Order');
                      AResponse := FindResponseByName('ORDERABLE', AnInstance);
                      if AResponse <> nil then
                        sub1 := GetSubtype(AResponse.EValue);
                      if sub1 = 't' then
                        begin
                          SetControl(cboAvailTest,       'ORDERABLE', AnInstance);
                          //SetControl(cboTests,           'ORDERABLE', AnInstance);
                          //DetermineCollectionDefaults(Responses);   //cboCollType = COLLECT , calCollTime = START
                          cboAvailTestSelect(self);
                        end;
                    end;
                  Changing := False;
                  if ObtainCollSamp then
                    begin
                      //For BloodBank orders, this condition should never occur
                    end
                  else
                    begin
                      with ALabTest do
                        with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                          begin
                            x := '' ;
                            for i := 0 to WardComment.Count-1 do
                            x := x + WardComment.strings[i]+#13#10 ;
                            pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                            OrderMessage(x) ;
                          end ;
                    end;
                end;
              if sub = 'c' then with ALabTest do  //COMPONENT
                begin
                  Changing := True;
                  DisableDiagTestControls;
                  EnableComponentControls;
                  LRORDERMODE := TORDER_MODE_COMP;
                  with Responses do
                    begin
                      StatusText('Initializing Order');
                      AResponse := FindResponseByName('ORDERABLE', AnInstance);
                      if AResponse <> nil then
                        sub1 := GetSubtype(AResponse.EValue);
                      if sub1 = 'c' then
                        begin
                          SetControl(cboAvailComp,       'ORDERABLE', AnInstance);
                          //SetControl(cboTests,           'ORDERABLE', AnInstance);
                          SetControl(cboModifiers,       'MODIFIER', AnInstance);
                          SetControl(tQuantity,          'QTY', AnInstance);
                          //DetermineCollectionDefaults(Responses);
                          cboAvailCompSelect(self);
                        end;
                    end;
                  Changing := False;
                end;
              with ALabTest do
                begin
                  if ObtainComment then
                    LoadRequiredComment(FCmtTypes.IndexOf(CurReqComment))
                  else
                    DisableCommentPanels;
                  x := '' ;
                  for i := 0 to CurWardComment.Count-1 do
                    x := x + CurWardComment.strings[i]+#13#10 ;
                  i :=  IndexOfCollSamp(CollSamp);
                  if i > -1 then with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                    for i := 0 to WardComment.Count-1 do
                      x := x + WardComment.strings[i]+#13#10 ;
                  pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                  if Length(x) > 0 then
                    begin
                      OrderMessage(x) ;
                    end;
                end;
              StatusText('');
              Changing := True;
              //if not(FOrderAction = ORDER_EDIT) then DetermineCollectionDefaults(Responses);
              Changing := False;
            end;
          AnInstance := NextInstance('ORDERABLE', AnInstance);
        end; //while AnInstance - ORDERABLE
      DisableComponentControls;
      DisableDiagTestControls;
      uQuickInProcess := 0;
    end;  }
  finally
    aList.Free;
    aTests.Free;
  end;
  edtResults.Height := 247;
  edtInfo.Height := 247;
  if lvSelectionList.Items.Count > 0 then
    begin
      pnlSelectedTests.Visible := True;
      cmdAccept.Visible := True;
      memOrder.Visible := True;
      GroupBox1.Visible := False;
    end;
end;

procedure TfrmODBBank.SetOnQuickOrder;
  var
  AnInstance: Integer;
  AResponse: TResponse;
  i: integer;
  x,sub,sub1,aTNSString: string;
  aList: TStringList;
  aGotIt: boolean;
  aTests: TStringList;
  ListItem: TListItem;
  aName, aMsg, aStr, aModifier, aReason, aSurgery, aCollTime, aTestYes, aSpecimen, aTypeScreen: String;
  CurAdd, j, k, getTest, TestAdded, aMSBOS, aMSBOSContinue, aTNS, aTNSDays: Integer;
begin
  inherited;
  aList := TStringList.Create;
  aTests := TStringList.Create;
  try
    aModifier := '';
    aReason := '';
    aSurgery := '';
    aCollTime := '';
    aTestYes := '0';
    aTypeScreen := '';
    aSpecimen := '';
    sub1 := '';
    ExtractTypeScreen(aList, uVBECList);
    if aList.Count > 0 then aTypeScreen := aList[0];
    aList.Clear;
    Extractspecimen(aList, uVBECList);
    if aList.Count > 0 then aSpecimen := aList[0];
    with Responses, ALabTest do
      begin
        Changing := True;
        aGotIt := False;
        FLastItemID := cboQuick.ItemID;
        QuickOrder := ExtractInteger(cboQuick.ItemID);
        with Responses do
          begin
            StatusText('Initializing Quick Order');
            AnInstance := NextInstance('ORDERABLE', 0);
            while AnInstance > 0 do
              begin
                AResponse := FindResponseByName('ORDERABLE', AnInstance);
                sub := GetSubtype(AResponse.EValue);
                if sub = 't' then
                  begin
                    SetControl(cboAvailTest,        'ORDERABLE', AnInstance);
                    ALabTest := TLabTest.Create(cboAvailTest.ItemID, Responses);
                  end
                else
                  begin
                    SetControl(cboAvailComp,        'ORDERABLE', AnInstance);
                    ALabTest := TLabTest.Create(cboAvailComp.ItemID, Responses);
                  end;
                for i := 0 to aList.Count - 1 do
                  if aList[i] = ALabTest.TestName then
                    begin
                      aGotIt := true;
                      break;
                    end;
                if aGotIt = true then
                  begin
                    aGotIt := false;
                    AnInstance := NextInstance('ORDERABLE', AnInstance);
                    Continue;
                  end
                  else
                    begin
                      aList.Add(ALabTest.TestName);
                    end;
                if AResponse <> nil then
                  sub1 := GetSubtype(AResponse.EValue);
                if AnInstance = 1 then
                  begin
                    SetControl(cboReasons,         'REASON', AnInstance);
                    SetControl(calWantTime,        'DATETIME', AnInstance);
                    SetControl(memDiagComment,     'COMMENT', AnInstance);
                    SetControl(chkConsent,         'YN', AnInstance);
                    //DetermineCollectionDefaults(Responses);
                    SetControl(cboCollType,        'COLLECT', AnInstance);
                    SetupCollTimes(cboCollType.ItemID);
                    //SetControl(cboCollTime,        'START', AnInstance);
                    //LoadUrgency(cboCollType.ItemID, cboUrgency);
                    SetControl(cboUrgency,         'URGENCY', AnInstance);
                    Urgency := cboUrgency.ItemIEN;
                    if (Urgency = 0) and (cboUrgency.Items.Count = AnInstance) then
                      begin
                        cboUrgency.ItemIndex := 0;
                        Urgency := cboUrgency.ItemIEN;
                        cboUrgencyChange(self);
                      end;
                    SetControl(cboSurgery,         'MISC', AnInstance);
                    if not(ALabTest = nil) then
                      begin
                        Urgency := cboUrgency.ItemIEN;
                        if (Urgency = 0) and (cboUrgency.Items.Count = 1) then
                          begin
                            cboUrgency.ItemIndex := 0;
                            Urgency := cboUrgency.ItemIEN;
                          end;
                        i := 1 ;
                        AResponse := Responses.FindResponseByName('COMMENT',i);
                        while AResponse <> nil do
                          begin
                            Comment.Add(AResponse.EValue);
                            Inc(i);
                            AResponse := Responses.FindResponseByName('COMMENT',i);
                          end ;
                      end;
                    if not(cboCollType.ItemID = 'LC') then
                      begin
                        if Length(cboCollTime.Text) > 0 then
                          begin
                            calCollTime.FMDateTime := StrToFMDateTime(cboCollTime.Text);
                            FLastCollTime := cboCollTime.Text;
                          end
                        else
                          begin
                            FLastCollTime := '';
                          end;
                      end;
                  end;
                if sub1 = 'c' then
                  begin
                    DisableDiagTestControls;
                    EnableComponentControls;
                    LRORDERMODE := TORDER_MODE_COMP;
                    SetControl(cboAvailComp,       'ORDERABLE', AnInstance);
                    SetControl(cboModifiers,       'MODIFIER', AnInstance);
                    SetControl(tQuantity,          'QTY', AnInstance);
                    //DetermineCollectionDefaults(Responses);
                    //Check for and display any associated Lab Results
                    aList.Clear;
                    TestAdded := 0;
                    getTest := 0;
                    ExtractTests(aList, uVBECList);   //Get Results associated with ordered components
                      for j := 0 to aList.Count - 1 do
                        begin
                          if StrToInt(piece(aList[j],'^',1)) = aLabTest.ItemID then
                            begin
                              if uTestsForResults.Count < 1 then getTest := 1;
                              for k := 0 to uTestsForResults.Count - 1 do
                                begin
                                  if piece(uTestsForResults[k],'^',1) = piece(aList[j],'^',3) then
                                    begin
                                      getTest := 0;
                                      break;
                                    end
                                  else getTest := 1;
                                end;
                              if getTest = 1 then
                                begin
                                  uTestsForResults.Add(piece(aList[j],'^',3));
                                  TestAdded := 1;
                                end;
                            end;
                        end;
                      if TestAdded = 1 then
                        begin
                          edtResults.Clear;
                          aTests.Clear;
                          GetPatientBloodResults(aTests, Patient.DFN, uTestsForResults);
                          QuickCopy(ATests,edtResults);
                          if edtResults.Lines.Count > 0 then TabResults.Caption := 'Lab Results Available'; //TabResults.ImageIndex := 1;
                          uRaw.Clear;
                          GetPatientBloodResultsRaw(uRaw, Patient.DFN, uTestsForResults);
                        end;
                      CurAdd := 1;
                      if uRaw.Count > 0 then
                      for j := 0 to uRaw.Count - 1 do
                        begin
                          if Length(uRaw[j]) > 0 then Responses.Update('RESULTS', CurAdd, uRaw[j], piece(uRaw[j],'^',1));
                          Inc(CurAdd);
                        end;
                    aSpecimen := '^';
                    aTestYes := '0';
                    aReason := '';
                    aSurgery := '';
                    aCollTime := '';
                    ExtractSpecimen(aList, uVBECList);
                    if aList.Count > 0 then aSpecimen := aList[0];
                    if length(cboModifiers.ItemID) > 0 then aModifier := cboModifiers.Items[cboModifiers.ItemIndex];
                    if length(cboReasons.ItemID) > 0 then aReason := cboReasons.Items[cboReasons.ItemIndex];
                    if length(cboSurgery.ItemID) > 0 then aSurgery := cboSurgery.Items[cboSurgery.ItemIndex];
                    if length(cboCollTime.ItemID) > 0 then aCollTime := cboCollTime.Items[cboCollTime.ItemIndex];
                    if Length(cboSurgery.ItemID) > 0 then
                      begin
                        aList.Clear;
                        ExtractMSBOS(aList, uVBECList);    //Get maximum units for selected Surgey
                        for i := 0 to aList.Count - 1 do
                          begin
                            if (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID)
                             and (piece(aList[i],'^',3) = cboSurgery.Text) then
                              begin
                                aMSBOS := StrToInt(piece(aList[i],'^',4));
                                if (aMSBOS > 0) and (StrToInt(tQuantity.Text) > aMSBOS) then
                                  begin
                                    with Application do
                                    begin
                                      NormalizeTopMosts;
                                      aMSBOSContinue :=
                                        MessageBox(PChar('The number of units ordered (' + tQuantity.Text +
                                                   ') for ' + aLabTest.TestName + ' exceeds the maximum number of units ('
                                                   + IntToStr(aMSBOS) +
                                                   ') for the ' + cboSurgery.text +
                                                   ' surgical procedure selected.' + CRLF + CRLF + 'Do you wish to continue?'),
                                                   PChar('Maximum Number of Units Exceeded'),
                                                   MB_YESNO);
                                      RestoreTopMosts;
                                    end;
                                    if aMSBOSContinue = 7 then
                                      begin
                                        ShowMsg(cboAvailComp.Text + ' has NOT been added to this request.');
                                        exit;
                                      end;
                                  end;
                              end;
                          end;
                      end;
                    if (uTNSOrders.Count < 1) then //SpecimenNeeded(aList, uVBECList, aLabTest.ItemID) then  //check to see if type and screen is needed
                      begin
                        uGetTnS := 1;
                      end;
                    aList.Clear;
                    ExtractSpecimens(aList, uVBECList);    //Get specimen values to pass back to Server
                    for i := 0 to aList.Count - 1 do
                      begin
                        if (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID) then
                          begin
                            aSpecimen := piece(aList[i],'^',2) + '^' + aSpecimen;
                            break;
                          end;
                      end;
                    uComponentSelected := true;
                    with lvSelectionList do
                      begin
                        ListItem := Items.Add;
                        ListItem.Caption := piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',2);
                        ListItem.SubItems.Add(tQuantity.Text);
                        if length(cboModifiers.ItemID) > 0 then
                          begin
                            ListItem.SubItems.Add(cboModifiers.Items[cboModifiers.ItemIndex]);
                            ListItem.SubItems.Add(IntToStr(cboModifiers.ItemIndex));
                          end
                          else
                            begin
                              ListItem.SubItems.Add('');
                              ListItem.SubItems.Add('');
                            end;
                        ListItem.SubItems.Add(piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',1));
                      end;
                    CurAdd := 1;
                    aStr := aTestYes + '^' + IntToStr(aLabTest.TestID) + '^' + tQuantity.Text + '^' + aModifier + '^' + aSpecimen + '^' + IntToStr(aLabTest.ItemID);  //aSpecimen has 2 pieces additional pieces added for Tests
                    uSelectedItems.Add(aStr);
                    for i := 0 to uSelectedItems.Count - 1 do
                      begin
                        aName := lvSelectionList.Items[i].Caption;
                        x := uSelectedItems[i];
                        if piece(x,'^',1) = '1' then    //Diagnostic Test related fields
                          begin
                            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
                          end
                        else
                          begin
                            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
                            if Length(piece(x,'^',3)) > 0 then Responses.Update('QTY', CurAdd, piece(x,'^',3), piece(x,'^',3));
                            if Length(piece(x,'^',4)) > 0 then Responses.Update('MODIFIER', CurAdd, piece(x,'^',4), aModifier);
                            if Length(piece(x,'^',5)) > 0 then Responses.Update('SPECSTS', CurAdd, pieces(x,'^',5,7), piece(x,'^',5));
                            if Length(cboSurgery.Text) > 0 then Responses.Update('MISC',1,cboSurgery.Text,cboSurgery.Text);
                          end;
                        Inc(CurAdd);
                      end;
                    memOrder.Text := Responses.OrderText;
                    GroupBox1.Visible := False;
                  aMsg := '';
                  LRORDERMODE := TORDER_MODE_INFO;
                  {if uGetTnS = 1 then
                    begin
                      lblTNS.Caption := 'TYPE + SCREEN must be added to order';
                      lblTNS.Visible := true;
                      memMessage.Text := 'TYPE + SCREEN must be added to order';
                      memMessage.Visible := false;
                      pnlMessage.Visible := true;
                      pnlDiagnosticTests.Caption := 'Diagnostic Tests*';
                    end;  }
                  {if uGetTnS = 1 then
                    begin
                      if responses.QuickOrder < 1 then
                        begin
                          for i := 1 to cboAvailTest.Items.Count - 1 do
                            begin
                              if piece(cboAvailTest.Items[i],'^',1) = aTypeScreen then
                                begin
                                  if piece(aSpecimen,'^',1) = '1' then
                                    begin
                                      cboCollTime.Text := calWantTime.Text;
                                      aCollSave := cboCollTime.Text + '^' + cboCollTime.ItemID + '^' + cboCollType.Text + '^' + cboCollType.ItemID;
                                      cboCollTime.Text := '';
                                      cboCollType.Text := '';
                                      uSpecimen := 1;
                                    end;
                                  cboModifiers.Text := '';
                                  cboAvailTest.SelectByID(aTypeScreen);
                                  cboTests.SelectByID(aTypeScreen);
                                  cboTestsClick(self);
                                  //cboAvailTestSelect(Self);
                                  uSpecimen := 0;
                                  cboCollTime.Text := piece(aCollSave,'^',1);
                                  cboCollType.Text := piece(aCollSave,'^',3);
                                  aCollSave := '';
                                  break;
                                end;
                            end;
                          aMsg := 'An order for Type and Screen has been added to this request' + '.';
                        end
                        else
                          begin
                            lblTNS.Caption := 'TYPE + SCREEN must be added to order';
                            lblTNS.Visible := true;
                            memMessage.Text := 'TYPE + SCREEN must be added to order';
                            memMessage.Visible := false;
                            pnlMessage.Visible := true;
                          end;
                    end;
                  if (uGetTnS = 1) then
                    begin
                      if length(aMsg) > 0 then aMsg := aMsg + crlf + crlf;
                      ShowMsg(aMsg);
                    end;  }

                  //cboModifiers.Text := '';
                  edtResults.Height := 247;
                  edtInfo.Height := 247;
                  if lvSelectionList.Items.Count > 0 then
                    begin
                      pnlSelectedTests.Visible := True;
                      cmdAccept.Visible := True;
                      memOrder.Visible := True;
                      GroupBox1.Visible := False;
                    end;
                  end
                  else
                    begin
                      if sub1 = 't' then
                      begin
                        DisableComponentControls;
                        EnableDiagTestControls;
                        LRORDERMODE := TORDER_MODE_DIAG;
                        aTestYes := '1';
                        SetControl(cboAvailTest,       'ORDERABLE', AnInstance);
                        //DetermineCollectionDefaults(Responses);   //cboCollType = COLLECT , calCollTime = START
                        i := 1 ;
                        AResponse := Responses.FindResponseByName('COMMENT',i);
                        while AResponse <> nil do
                          begin
                            Comment.Add(AResponse.EValue);
                            Inc(i);
                            AResponse := Responses.FindResponseByName('COMMENT',i);
                          end ;
                        if ObtainCollSamp then
                          begin
                          //For BloodBank orders, this condition should never occur
                          end
                        else
                          begin
                            with ALabTest do
                              with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                                begin
                                  x := '' ;
                                  for i := 0 to WardComment.Count-1 do
                                  x := x + WardComment.strings[i]+#13#10 ;
                                  pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                                  OrderMessage(x) ;
                                end ;
                          end;
                        if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
                        with cboCollType do if Length(ItemID) > 0 then
                          begin
                            Responses.Update('COLLECT', 1, ItemID, ItemID) ;
                            FLastCollType := ItemID;
                          end;
                        if Length(cboUrgency.Text) > 0 then Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text)
                          else
                            begin
                              cboUrgency.ItemIndex := 1;
                              Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
                              cboUrgencyChange(self);
                            end;
                        if Length(memDiagComment.Text) > 0 then Responses.Update('COMMENT',1,memDiagComment.Text,memDiagComment.Text);
                        if Length(cboReasons.Text) > 0 then Responses.Update('REASON',1,cboReasons.Text,cboReasons.Text);
                        LoadCollType(cboCollType);
                        if (cboCollType.ItemID = 'LC') or (cboCollType.ItemID = 'I') then
                          if not(ALabTest.LabCanCollect) and OrderForInpatient then
                            cboCollType.SelectByID('WC')
                          else if not(ALabTest.LabCanCollect) then
                            cboCollType.SelectByID('SP');
                        SetupCollTimes(cboCollType.ItemID);
                        if cboCollType.ItemID = 'LC' then
                          begin
                            with cboCollTime do
                              if Length(ItemID) > 0 then
                                begin
                                  Responses.Update('START', 1, Copy(ItemID, 2, 999), Copy(ItemID, 2, 999));
                                  FLastLabCollTime := ItemID + U + Text;
                                end
                              else if Length(Text) > 0 then
                                begin
                                  Responses.Update('START', 1, ValidCollTime(Text), Text) ;
                                  FLastLabCollTime := ValidCollTime(Text);
                                end;
                          end
                        else
                          begin
                            with calCollTime do
                              if FMDateTime > 0 then
                                begin
                                  Responses.Update('START', 1, ValidCollTime(Text), Text);
                                  FLastColltime := ValidCollTime(Text);
                                end
                              else
                                begin
                                  Responses.Update('START', 1, '', '') ;
                                  FLastCollTime := '';
                                end;
                          end;
                        if length(cboCollTime.ItemID) > 0 then aCollTime := cboCollTime.Items[cboCollTime.ItemIndex];
                        with cboCollType do if Length(ItemID) > 0 then
                          begin
                            Responses.Update('COLLECT', 1, ItemID, ItemID) ;
                            FLastCollType := ItemID;
                          end;
                        uTestSelected := true;
                        with lvSelectionList do
                          begin
                            ListItem := Items.Add;
                            ListItem.Caption := piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',2);
                            ListItem.SubItems.Add('');
                            ListItem.SubItems.Add('');
                            ListItem.SubItems.Add('');
                            ListItem.SubItems.Add(piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',1));
                          end;
                        CurAdd := 1;
                        aStr := aTestYes + '^' + IntToStr(aLabTest.TestID) + '^' + tQuantity.Text + '^' + aModifier + '^' + aSpecimen + '^' + aCollTime + '^' + cboCollType.Text + '^' + IntToStr(aLabTest.ItemID);  //aSpecimen has 2 pieces
                        uSelectedItems.Add(aStr);
                        for i := 0 to uSelectedItems.Count - 1 do
                          begin
                            aName := lvSelectionList.Items[i].Caption;
                            x := uSelectedItems[i];
                            if piece(x,'^',1) = '1' then    //Diagnostic Test related fields
                              begin
                                if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
                              end;
                            Inc(CurAdd);
                          end;
                        memOrder.Text := Responses.OrderText;
                      edtResults.Height := 247;
                      edtInfo.Height := 247;
                      if lvSelectionList.Items.Count > 0 then
                        begin
                          pnlSelectedTests.Visible := True;
                          cmdAccept.Visible := True;
                          memOrder.Visible := True;
                          GroupBox1.Visible := False;
                        end;
                      end;
                    end;
                  AnInstance := NextInstance('ORDERABLE', AnInstance);
              end;
              //Quick Order
          end;
        for i := 0 to lvSelectionList.Items.Count - 1 do
          begin
            if lvSelectionList.Items[i].SubItems[3] = aTypeScreen then
              begin
                uGetTnS := 0;
                uDfltUrgency := cboUrgency.ItemID;
                lblTNS.Caption := '';
                lblTNS.Visible := false;
                memMessage.Text := '';
                pnlMessage.Visible := false;
                pnlDiagnosticTests.Caption := 'Diagnostic Tests';
                if uTNSOrders.Count > 0 then
                  begin
                    for j := 0 to uTNSOrders.Count - 1 do
                      aTNSString := aTNSString + CRLF + uTNSOrders[j];
                    with Application do
                      begin
                        NormalizeTopMosts;
                        aTNSDays := TNSDaysBack;
                        aTNS :=
                          MessageBox(PChar(aTNSString + CRLF + CRLF +
                                     'Do you wish to continue with this request for Type & Screen?'),
                                     PChar('Type & Screen Entered in Past ' + IntToStr(TNSDaysBack) + ' Days'),
                                     MB_YESNO);
                        RestoreTopMosts;
                        if aTNS = 7 then
                          begin
                            lvSelectionList.ItemIndex := i;
                            lvSelectionListClick(self);
                            btnRemoveClick(self);
                            break;
                          end;
                      end;
                  end;
                break;
              end;
          end;
        if uGetTnS = 1 then
          begin
            lblTNS.Caption := 'TYPE + SCREEN must be added to order';
            lblTNS.Visible := true;
            memMessage.Text := 'TYPE + SCREEN must be added to order';
            pnlMessage.Visible := true;
            pnlDiagnosticTests.Caption := 'Diagnostic Tests*';
          end;
        if ALabTest <> nil then
          begin
            if ObtainCollSamp then
              begin
               //For BloodBank orders, this condition should never occur
              end
            else
              begin
                with ALabTest do
                  with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                    begin
                      x := '' ;
                      for i := 0 to WardComment.Count-1 do
                      x := x + WardComment.strings[i]+#13#10 ;
                      pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                      OrderMessage(x) ;
                    end ;
              end;
            with ALabTest do
              begin
                if ObtainComment then
                  LoadRequiredComment(FCmtTypes.IndexOf(CurReqComment))
                else
                  DisableCommentPanels;
                x := '' ;
                for i := 0 to CurWardComment.Count-1 do
                  x := x + CurWardComment.strings[i]+#13#10 ;
                i :=  IndexOfCollSamp(CollSamp);
                if i > -1 then with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                  for i := 0 to WardComment.Count-1 do
                    x := x + WardComment.strings[i]+#13#10 ;
                pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                OrderMessage(x) ;
              end;
            GroupBox1.Visible := False;
          end;
        StatusText('');
        Changing := False;
      end;
  finally                      //**SubTest
    alist.Free;
    aTests.Free;
  end;
end;

constructor TLabTest.Create(const LabTestIEN: string; Responses: TResponses);
var
  LoadData, OneSamp: TStringList;
  DfltCollSamp: Integer;
  x: string;
  tmpResp: TResponse;
begin
  LoadData := TStringList.Create;
  try
    LoadLabTestData(LoadData, LabTestIEN) ;
    with LoadData do
    begin
      QuickOrderResponses := Responses;
      TestID := StrToInt(LabTestIEN);
      TestName := Piece(ExtractDefault(LoadData, 'Test Name'),U,1);
      ItemID := StrToInt(Piece(ExtractDefault(LoadData, 'Item ID'),U,1));
      LabSubscript := Piece(ExtractDefault(LoadData, 'Item ID'),U,2);
      TestReqComment := ExtractDefault(LoadData, 'ReqCom');
      UniqueCollSamp := false;
      if Length(ExtractDefault(LoadData, 'Unique CollSamp')) > 0 then UniqueCollSamp := True;
      x := ExtractDefault(LoadData, 'Unique CollSamp');
      if Length(x) = 0 then x := ExtractDefault(LoadData, 'Lab CollSamp');
      if Length(x) = 0 then x := ExtractDefault(LoadData, 'Default CollSamp');
      if Length(x) = 0 then x := '-1';
      DfltCollSamp := StrToInt(x);
      SpecimenList := TStringList.Create;
      ExtractItems(SpecimenList, LoadData, 'Specimens');
      if LRFSPEC <> '' then SpecimenList.Add(GetOneSpecimen(StrToInt(LRFSPEC)));
      UrgencyList := TStringList.Create;
      if Length(ExtractDefault(LoadData, 'Default Urgency')) > 0 then  { forced urgency }
        begin
          ForceUrgency := True;
          UrgencyList.Add(ExtractDefault(LoadData, 'Default Urgency'));
          Urgency := StrToInt(Piece(ExtractDefault(LoadData, 'Default Urgency'), '^', 1));
          uDfltUrgency := Urgency;
        end
      else
        begin                 { list of urgencies }
          ExtractItems(UrgencyList, LoadData, 'Urgencies');
          if StrToIntDef(LRFURG, 0) > 0 then
            Urgency := StrToInt(LRFURG)
          else
            Urgency := uDfltUrgency;
        end;
      Comment := TStringList.Create ;
      CurWardComment := TStringList.Create;
      ExtractText(CurWardComment, LoadData, 'GenWardInstructions');
      CollSamp := 0;
      CollSampList := TList.Create;
      FillCollSampList(LoadData, DfltCollSamp);
      with QuickOrderResponses do tmpResp := FindResponseByName('SAMPLE'  ,1);
      if (LRFSAMP <> '') and (IndexOfCollSamp(StrToInt(LRFSAMP)) < 0) and
         (not UniqueCollSamp) and (tmpResp = nil) then
        begin
          OneSamp := TStringList.Create;
          try
            FastAssign(GetOneCollSamp(StrToInt(LRFSAMP)), OneSamp);
            FillCollSampList(OneSamp, CollSampList.Count);
          finally
            OneSamp.Free;
          end;
        end;
      if (not UniqueCollSamp) and (CollSampList.Count = 0) then LoadAllSamples;
      CollSampCount := CollSampList.Count;
    end;
  finally
    LoadData.Free;
  end;
  SetCollSampDflts;
end;

destructor TLabTest.Destroy;
var
  i: Integer;
begin
  if CollSampList <> nil then
    with CollSampList do for i := 0 to Count - 1 do
     with TCollSamp(Items[i]) do
      begin
        WardComment.Free;
        Free;
      end;
  CollSampList.Free;
  SpecimenList.Free;
  UrgencyList.Free;
  CurWardComment.Free;
  Comment.Free;
  inherited Destroy;
end;

function TLabTest.IndexOfCollSamp(CollSampIEN: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  with CollSampList do for i := 0 to Count - 1 do with TCollSamp(Items[i]) do
    if CollSampIEN = CollSampID then
    begin
      Result := i;
      break;
    end;
end;

procedure TLabTest.LoadAllSamples;
var
  LoadList, SpecList: TStringList;
  i: Integer;
begin
  LoadList := TStringList.Create;
  SpecList := TStringList.Create;
  try
    LoadSamples(LoadList) ;
    FillCollSampList(LoadList, 0);
    ExtractItems(SpecList, LoadList, 'Specimens');
    with SpecList do for i := 0 to Count - 1 do
      if SpecimenList.IndexOf(Strings[i]) = -1 then SpecimenList.Add(Strings[i]);
  finally
    LoadList.Free;
    SpecList.Free;
  end;
end;

procedure TLabTest.FillCollSampList(LoadData: TStringList; DfltCollSamp: Integer);
{1  2        3         4       5         6          7         8          9               10   }
{n^IEN^CollSampName^SpecIEN^TubeTop^MinInterval^MaxPerDay^LabCollect^SampReqCommentIEN;name^SpecName}
var
  i, LastListItem, AnIndex: Integer;
  ACollSamp: TCollSamp;
  LabCollSamp: Integer;
begin
  i := -1;
  if CollSampList = nil then CollSampList := TList.Create;
  LastListItem := CollSampList.Count ;
  LabCollSamp := StrToIntDef(ExtractDefault(LoadData, 'Lab CollSamp'), 0);
  repeat Inc(i) until (i = LoadData.Count) or (LoadData[i] = '~CollSamp');
  Inc(i);
  if i < LoadData.Count then repeat
    if LoadData[i][1] = 'i' then
      begin
        ACollSamp := TCollSamp.Create;
        with ACollSamp do
          begin
            AnIndex         := StrToIntDef(Copy(Piece(LoadData[i], '^', 1), 2, 999), -1);
            CollSampID      := StrToInt(Piece(LoadData[i], '^', 2));
            CollSampName    := Piece(LoadData[i], '^', 3);
            SpecimenID      := StrToIntDef(Piece(LoadData[i], '^', 4), 0);
            SpecimenName    := Piece(LoadData[i], '^', 10);
            TubeColor       := Piece(LoadData[i], '^', 5);
            MinInterval     := StrToIntDef(Piece(LoadData[i], '^', 6), 0);
            MaxPerDay       := StrToIntDef(Piece(LoadData[i], '^', 7), 0);
            LabCanCollect   := AnIndex = LabCollSamp;
            SampReqComment  := Piece(LoadData[i], '^', 9);
            WardComment     := TStringList.Create;
            if CollSampID  = StrToIntDef(LRFSAMP, 0) then
              CollSamp := CollSampID
            else if AnIndex = DfltCollSamp then
              CollSamp := CollSampID;
          end; {with}
        LastListItem := CollSampList.Add(ACollSamp);
      end; {if}
    if (LoadData[i][1] = 't') then
      TCollSamp(CollSampList.Items[LastListItem]).WardComment.Add(Copy(LoadData[i], 2, 255));
    Inc(i);
  until (i = LoadData.Count) or (LoadData[i][1] = '~');
end;

procedure TLabTest.SetCollSampDflts;
var
  tmpResp: TResponse;
begin
  Specimen := 0;
  Comment.Clear;
  CurReqComment := TestReqComment;
  if CollSamp = 0 then Exit;
  with QuickOrderResponses do tmpResp := FindResponseByName('SPECIMEN'  ,1);
  if (LRFSPEC <> '') and (tmpResp = nil) then
    ChangeSpecimen(LRFSPEC)
  else with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
    begin
      Specimen := SpecimenID;
      if SampReqcomment <> '' then CurReqComment := SampReqComment;
    end;
end;

procedure TLabTest.ChangeCollSamp(CollSampIEN: Integer);
begin
  CollSamp := CollSampIEN;
  SetCollSampDflts;
end;

procedure TLabTest.ChangeSpecimen(const SpecimenIEN: string);
begin
  Specimen := StrToIntDef(SpecimenIEN,0);
end;

procedure TLabTest.ChangeComment(const CommentText: string);
begin
  Comment.Add(CommentText);
end;

function TLabTest.LabCanCollect: Boolean;
var
  i: Integer;
begin
  Result := False;
  i := IndexOfCollSamp(CollSamp);
  if i > -1 then with TCollSamp(CollSampList.Items[i]) do Result := LabCanCollect;
end;

procedure TLabTest.LoadCollSamp(AComboBox: TORComboBox);
{ loads the collection sample combo box, expects CollSamp to already be set to default }
var
  i: Integer;
  x: string;
begin
  AComboBox.Clear;
  with CollSampList do for i := 0 to Count - 1 do with TCollSamp(Items[i]) do
  begin
    x := IntToStr(CollSampID) + '^' + CollSampName;
    if Length(TubeColor) <> 0 then x := x + ' (' + TubeColor + ')';
    AComboBox.Items.Add(x);
    if CollSamp = CollSampID then AComboBox.ItemIndex := i;
  end;
  if ((ALabTest.LabSubscript = 'CH') and (not UserHasLRLABKey)) then
    begin
      // do not add 'Other'   (coded this way for clarity)
    end
  else
    with AComboBox do
      begin
        Items.Add('0^Other...');
        if ItemIndex < 0 then ItemIndex := Items.IndexOf('Other...');
      end;
end;

procedure TLabTest.LoadSpecimen(AComboBox: TORComboBox);
{ loads specimen combo box, if SpecimenList is empty, use 'E' xref on 61 ?? }
var
  i: Integer;
  tmpResp: TResponse;
begin
  AComboBox.Clear;
  if ObtainSpecimen then
    begin
      if SpecimenList.Count = 0 then LoadSpecimens(SpecimenList) ;
      FastAssign(SpecimenList, AComboBox.Items);
      AComboBox.Items.Add('0^Other...');
      with QuickOrderResponses do tmpResp := FindResponseByName('SPECIMEN'  ,1);
      if (LRFSPEC <> '') and (tmpResp = nil) then
        AComboBox.SelectByID(LRFSPEC)
      else if Specimen > 0 then
        AComboBox.SelectByIEN(Specimen)
      else
        AComboBox.ItemIndex := AComboBox.Items.IndexOf('Other...');
    end
  else
    begin
      i := IndexOfCollSamp(CollSamp);
      if i < CollSampList.Count then with TCollSamp(CollSampList.Items[i]) do
        begin
          AComboBox.Items.Add(IntToStr(SpecimenID) + '^' + SpecimenName);
          AComboBox.ItemIndex := 0;
        end;
      with QuickOrderResponses do tmpResp := FindResponseByName('SPECIMEN'  ,1);
      if (LRFSPEC <> '') and (tmpResp = nil) then
        begin
          AComboBox.Items.Add(GetOneSpecimen(StrToInt(LRFSPEC)));
          AComboBox.SelectByID(LRFSPEC);
        end;
    end;
  ChangeSpecimen(AComboBox.ItemID);
end;

procedure TLabTest.LoadUrgency(CollType: string; AComboBox:TORComboBox);
var
  i: integer;
begin
  if UrgencyList.Count < 1 then Exit;
  with AComboBox do
    begin
      Clear;
      for i := 0 to UrgencyList.Count - 1 do
         if (CollType = 'LC') and (Piece(UrgencyList[i], U, 3) = '') then
           Continue
         else
           Items.Add(UrgencyList[i]);
      if (LRFURG <> '') and (ALabTest.ObtainUrgency) then
        SelectByID(LRFURG)
      else
        SelectByIEN(uDfltUrgency);
      Urgency := AComboBox.ItemIEN;
    end;
end;

function TLabTest.NameOfCollSamp: string;
var
  i: Integer;
begin
  Result := '';
  i := IndexOfCollSamp(CollSamp);
  if i > -1 then with TCollSamp(CollSampList.Items[i]) do Result := CollSampName;
end;

function TLabTest.NameOfSpecimen: string;
var
  i: Integer;
begin
  Result := '';
  if CollSamp > 0 then with TCollSamp(CollSampList[IndexOfCollSamp(CollSamp)]) do
    if (Specimen > 0) and (Specimen = SpecimenID) then Result := SpecimenName;
  if (Length(Result) = 0) and (Specimen > 0) then with SpecimenList do
    for i := 0 to Count - 1 do if Specimen = StrToInt(Piece(Strings[i], '^', 1)) then
    begin
      Result := Piece(Strings[i], '^', 2);
      break;
    end;
end;

function TLabTest.NameOfUrgency: string;
var
  i: Integer;
begin
  Result := '';
  with UrgencyList do for i := 0 to Count - 1 do
  begin
    if StrToInt(Piece(Strings[i], '^', 1)) = Urgency
      then Result := Piece(Strings[i], '^', 2);
    break;
  end;
end;

function TLabTest.ObtainCollSamp: Boolean;
begin
  Result := (not UniqueCollSamp);
end;

function TLabTest.ObtainSpecimen: Boolean;
var
  i: Integer;
begin
  Result := True;
  i := IndexOfCollSamp(CollSamp);
  if (i > -1) and (i < CollSampList.Count) then with TCollSamp(CollSampList.Items[i]) do
    if SpecimenID > 0 then Result := False;
end;

function TLabTest.ObtainUrgency: Boolean;
begin
  Result := not ForceUrgency;
end;

function TLabTest.ObtainComment: Boolean;
begin
  Result := Length(CurReqComment) > 0;
end;

procedure TfrmODBBank.ExtractModifiers(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(Outlist, AList,'MODIFIERS');
end;

procedure TfrmODBBank.ExtractReasons(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(Outlist, AList,'REASONS');
end;

procedure TfrmODBBank.ExtractUrgencies(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(Outlist, AList,'URGENCIES');
end;

procedure TfrmODBBank.ExtractTNSOrders(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(Outlist, AList,'TNS ORDERS');
end;

procedure TfrmODBBank.ExtractSurgeries(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList,'SURGERIES');
end;

procedure TfrmODBBank.ExtractSpecimens(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList,'SPECIMENS');
end;

procedure TfrmODBBank.ExtractTypeScreen(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList, 'TYPE AND SCREEN');
end;

procedure TfrmODBBank.ExtractOther(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList, 'OTHER');
end;

procedure TfrmODBBank.ExtractSpecimen(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList, 'SPECIMEN');
end;

procedure TfrmODBBank.ExtractPatientInfo(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList, 'INFO');
end;

procedure TfrmODBBank.ExtractTests(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList, 'TESTS');
end;

procedure TfrmODBBank.ExtractMSBOS(OutList:TStrings; AList:TStrings);
begin
  ExtractItems(OutList, AList, 'MSBOS');
end;

function TfrmODBBank.SpecimenNeeded(OutList:TStrings; AList:TStrings; CompID:integer): Boolean;
var
  i:integer;
  aborh: boolean;
  aSpecimen, aSpecimenDate: string;
  aWantDateTime, aExpiredSpecimenDate: TFMDateTime;
begin
  result := false;
  aborh := false;
  aSpecimen := '';
  OutList.Clear;
  ExtractItems(OutList,Alist,'ABORH');
  for i := 0 to OutList.Count - 1 do
    begin
      if Length(OutList[i])>1 then
        begin
          aborh := true;
        end;
    end;
  if aborh = false then
    begin
      result := true;
      exit;
    end;
  OutList.Clear;
  ExtractSpecimen(OutList, uVBECList);
  if OutList.Count > 0 then aSpecimen := OutList[0];
  OutList.Clear;
  ExtractItems(OutList,AList,'SPECIMENS');
  aWantDateTime := calWantTime.FMDateTime;
  aSpecimenDate := piece(aSpecimen,'^',1);
  aExpiredSpecimenDate := 0;
  if Length(aSpecimenDate) > 0 then aExpiredSpecimenDate := StrToFloat(aSpecimenDate);

  for i := 0 to OutList.Count - 1 do
    begin
      if (IntToStr(aLabTest.ItemID) = piece(OutList[i],'^',1)) and (piece(OutList[i],'^',2) = '1') then
        if aSpecimen = '' then
          begin
            result := true;
            exit;
          end
        else if (Length(calWantTime.Text) > 0) and (aExpiredSpecimenDate < aWantDateTime) then
          begin
            result := true;
            exit;
          end;
    end;
end;

procedure TfrmODBBank.Validate(var AnErrMsg: string);

  procedure SetError(const x: string);
  begin
    if Length(AnErrMsg) > 0 then AnErrMsg := AnErrMsg + CRLF;
    AnErrMsg := AnErrMsg + x;
  end;

const
  TX_NO_TESTS       = 'No Tests or Components selected' ;
  TX_TNS_REQUIRED   = 'An order for TYPE and SCREEN must be created for this order set' ;

begin
  inherited;
  if uSelectedItems.Count < 1 then
    begin
      SetError(TX_NO_TESTS);
      Exit;
    end;
  if uGetTns = 1 then
    begin
      SetError(TX_TNS_REQUIRED);
      Exit;
    end;
  ValidateAdd(AnErrMsg);
end;

procedure TfrmODBBank.ValidateAdd(var AnErrMsg: string);

  procedure SetError(const x: string);
    begin
      if Length(AnErrMsg) > 0 then AnErrMsg := AnErrMsg + CRLF;
      AnErrMsg := AnErrMsg + x;
    end;

var
  aList: TStringList;
  i, DaysofFuturePast: integer;
  d1, d2: TDateTime;
  x,test,aOther: string;
const
  {Diagnostic Test Errors}
  TX_NO_TIME        = 'Collection Time is required' ;
  TX_NO_TCOLLTYPE   = 'Collection Type is required' ;
  TX_NO_TESTS       = 'A Lab Test or tests must be selected' ;
  TX_BAD_TIME       = 'Collection times must be chosen from the drop down list or entered as valid' +
                      ' Fileman date/times (T@1700, T+1@0800, etc.)' ;
  TX_PAST_TIME      = 'Collection times in the past are not allowed';
  TX_NO_DAYS        = 'A number of days must be entered for continuous orders';
  TX_NO_TIMES       = 'A number of times must be entered for continuous orders';
  TX_NO_STOP_DATE   = 'Could not calculate the stop date for the order.  Check "for n Days"';
  TX_TOO_MANY_DAYS  = 'Maximum number of days allowed is ';
  TX_TOO_MANY_TIMES = 'For this frequency, the maximum number of times allowed is:  X';
  //TX_NO_COMMENT     = 'A comment is required for this test and collection sample.';
  TX_NUMERIC_REQD   = 'A numeric value is required for urine volume';
  TX_DOSEDRAW_REQD  = 'Both DOSE and DRAW times are required for this order';
  TX_TDM_REQD       = 'A value for LEVEL is required for this order';
  //TX_ANTICOAG_REQD  = 'You must specify an anticoagulant on this order.' ;
  TX_NO_COLLSAMPLE  = 'A collection sample MUST be specified';
  TX_NO_SPECIMEN    = 'A specimen MUST be specified';
  TX_NO_URGENCY     = 'An urgency MUST be specified';
  TX_NO_FREQUENCY   = 'A collection frequency MUST be specified';
  TX_NOT_LAB_COLL_TIME = ' is not a routine lab collection time';
  TX_NO_ALPHA       = 'For continuous orders, enter a number of days, or an "X" followed by a number of times';
  TX_BADTIME_CAP    = 'Invalid Immediate Collect Time';
  {Component/Type & Screen Errors}
  TX_NO_COMPONENTS  = 'A Blood Product MUST be selected';
  TX_NO_QUANTITY    = 'The number of units MUST be specified under "Quantity"';
  TX_HIGH_QUANTITY  = 'Quantity too high';
  TX_NO_DATEMODIFIED= 'A Date/time Wanted MUST be specified';
  TX_NO_SURGERY     = 'A Surgery MUST be specified for Pre-Op orders';         //only if Pre-op selected
  TX_NO_REASON      = 'A Reason for Request MUST be entered';
  TX_REASON_TOO_LONG= 'Reason for Request MUST be less than 76 characters long';
  TX_MODIFIER_TOO_LONG = 'Modifer text MUST be less than 51 characters long';
  TX_NO_COMMENT     = 'A Comment MUST be entered for this Component';
  TX_DUPLICATE      = 'Duplicate Test/Component not allowed';
  TX_NO_TEST_SELECTED = 'No Test/Component selected';

begin
  inherited;
  AnErrMsg := '';
  aList := TStringList.Create;
  try
    ExtractOther(aList, uVBECList);
    if aList.Count > 0 then aOther := aList[0];
    aList.Clear;
    if uSelectedItems.Count < 1 then
      begin
        AnErrMsg := TX_NO_TEST_SELECTED;
        Exit;
      end;
    for i := 0 to uSelectedItems.Count - 1 do
      begin
        x := uSelectedItems[i];
        test := lvSelectionList.Items[i].Caption;
        if piece(x,'^',1) = '1' then    //Diagnostic Test
          begin
            if uSpecimen = 0 then
              if cboCollType.ItemID = '' then
                SetError(TX_NO_TCOLLTYPE + ' (' + test + ')')
              else if cboCollType.ItemID = 'LC' then
                begin
                 if Length(cboCollTime.Text) = 0 then SetError(TX_NO_TIME + ' (' + test + ')');
                 with cboCollTime do if (Length(Text) > 0) and (ItemIndex = -1) then
                   begin
                     if StrToFMDateTime(Text) < 0 then
                       SetError(TX_BAD_TIME + ' (' + test + ')')
                     else if StrToFMDateTime(Text) < FMNow then
                       SetError(TX_PAST_TIME + ' (' + test + ')')
                     else if OrderForInpatient then
                       begin
                         d1 := FMDateTimeToDateTime(Trunc(StrToFMDateTime(cboColltime.Text)));
                         d2 := FMDateTimeToDateTime(FMToday);
                         if EvtDelayLoc > 0 then
                           DaysofFuturePast := LabCollectFutureDays(EvtDelayLoc,EvtDivision)
                         else
                           DaysofFuturePast := LabCollectFutureDays(Encounter.Location);
                         if DaysofFuturePast = 0 then DaysofFuturePast := 7;
                         if ((d1 - d2) > DaysofFuturePast) then
                           SetError('A lab collection cannot be ordered more than '
                             + IntToStr(DaysofFuturePast) + ' days in advance');
                       end
                     else if EvtDelayLoc > 0 then
                       begin
                         if (not IsLabCollectTime(StrToFMDateTime(cboCollTime.Text), EvtDelayLoc)) then
                           SetError(cboCollTime.Text + TX_NOT_LAB_COLL_TIME + ' (' + test + ')');
                       end
                     else if EvtDelayLoc <= 0 then
                       begin
                         if (not IsLabCollectTime(StrToFMDateTime(cboCollTime.Text), Encounter.Location)) then
                           SetError(cboCollTime.Text + TX_NOT_LAB_COLL_TIME + ' (' + test + ')');
                       end;
                   end;
                end
              else
                begin
                  if cboCollType.ItemID = 'I' then
                    begin
                      calCollTime.Text := txtImmedColl.Text;
                      x := ValidImmCollTime(calCollTime.FMDateTime);
                      if (Piece(x, U, 1) <> '1') then
                        SetError(Piece(x, U, 2));
                    end;

                  with calColltime do
                    begin
                      if FMDateTime = 0 then SetError(TX_BAD_TIME + ' (' + test + ')')
                      else
                        begin
                          // date only was entered
                          if (FMDateTime - Trunc(FMDateTime) = 0) then
                            begin
                              if (Trunc(FMDateTime) < FMToday) then SetError(TX_PAST_TIME + ' (' + test + ')');
                            end
                          // date/time was entered
                          else
                            begin
                              if (UpperCase(Text) <> 'NOW') and (FMDateTime < FMNow) then SetError(TX_PAST_TIME + ' (' + test + ')');
                            end;
                        end;
                    end;
                end;

            with cboUrgency do if ItemIEN  <= 0 then SetError(TX_NO_URGENCY + ' (' + test + ')');
          end
        else                            //Component
          begin
            if piece(x,'^',3) ='' then SetError(TX_NO_QUANTITY + ' (' + test + ')')
              else
                begin
                  if StrToInt(piece(x,'^',3)) < 1 then SetError(TX_NO_QUANTITY + ' (' + test + ')');
                  if StrToInt(piece(x,'^',3)) > 100 then SetError(TX_HIGH_QUANTITY + ' (' + test + ')');
                end;
            if calWantTime.Text = '' then SetError(TX_NO_DATEMODIFIED + ' (' + test + ')');
            if (cboReasons.Text = '') and not(uReason = '') then
              begin
                SetError(TX_NO_REASON + ' (' + test + ').' + ' Previously entered ''Reason for Request'' will be retained.');
                cboReasons.Text := uReason; //reset reason back to previous value
              end;
              if (cboReasons.Text = '') then
                begin
                  SetError(TX_NO_REASON + ' (' + test + ').');
                end;
            if (memDiagComment.Text = '') and (piece(x,'^',2) = aOther) then SetError(TX_NO_COMMENT + ' (' + test + ')');
            if (cboUrgency.Text = 'PRE-OP') and (length(cboSurgery.Text) < 1) then SetError(TX_NO_SURGERY + ' (' + test + ')');
            if (length(cboReasons.Text) > 75) then SetError(TX_REASON_TOO_LONG);
            if (length(cboModifiers.Text) > 50) then SetError(TX_MODIFIER_TOO_LONG);
          end;
      end;
  finally
    aList.Free;
  end;
end;

function TfrmODBBank.ValidAdd: Boolean;
const
  TX_NO_SAVE     = 'This item cannot be added for the following reason(s):' + CRLF + CRLF;
  TX_NO_SAVE_CAP = 'Unable to Add item';
  TX_SAVE_ERR    = 'Unexpected error - it was not possible to Add this item.';
var
  ErrMsg: string;

begin
  Result := True;
  ValidateAdd(ErrMsg);
  if Length(ErrMsg) > 0 then
  begin
    InfoBox(TX_NO_SAVE + ErrMsg, TX_NO_SAVE_CAP, MB_OK);
    Result := False;
    Exit;
  end;
end;

function TfrmODBBank.ValidCollTime(UserEntry: string): string;
var
  i: integer;
const
  FMDateResponses: array[0..3] of string = ('TODAY','NOW','NOON','MID');
begin
  Result := '';
  UserEntry := UpperCase(UserEntry);
  if StrToFMDateTime(UserEntry) < 0 then exit;
  if (UserEntry = 'T') or
     (UserEntry = 'N') or
     (Copy(UserEntry,1,2)='T+') or
     (Copy(UserEntry,1,2)='T@') or
     (Copy(UserEntry,1,2)='T-') or
     (Copy(UserEntry,1,2)='N+') then Result := UserEntry
  else
     for i := 0 to 3 do if Pos(FMDateResponses[i],UserEntry)>0 then Result := UserEntry ;
  if Result = '' then Result := FloatToStr(StrToFMDateTime(UserEntry));
end;

procedure TfrmODBBank.GetAllCollSamples(AComboBox: TORComboBox);
var
  OtherSamp: string;
begin
  with ALabTest, AComboBox do
    begin
      if ((CollSampList.Count + 1) <= AComboBox.Items.Count) then LoadAllSamples;
      OtherSamp := SelectOtherCollSample(Font.Size, CollSampCount, CollSampList);
      if OtherSamp = '-1' then exit;
      if SelectByID(Piece(OtherSamp, U, 1)) = -1 then
        if Items.Count > CollSampCount + 1 then
          Items[0] := OtherSamp
        else
          Items.Insert(0, OtherSamp) ;
      SelectByID(Piece(OtherSamp, U, 1));
      AComboBox.OnChange(Self);
      ActiveControl := cmdAccept;
    end;
end;

procedure TfrmODBBank.GetAllSpecimens(AComboBox: TORComboBox);
var
  OtherSpec: string;
begin
  inherited;
  if ALabTest <> nil then
    with ALabTest, AComboBox do
      begin
        AComboBox.DroppedDown := False;
        OtherSpec := SelectOtherSpecimen(Font.Size, SpecimenList);
        if OtherSpec = '-1' then exit;
        if SelectByID(Piece(OtherSpec, U, 1)) = -1 then
          if Items.Count > SpecListCount + 1 then
            Items[0] := OtherSpec
          else
            Items.Insert(0, OtherSpec) ;
        SpecimenList.Add(OtherSpec);
        SelectByID(Piece(OtherSpec, U, 1));
        AComboBox.OnChange(Self);
      end;
end;

procedure TfrmODBBank.SetupCollTimes(CollType: string);
var
  tmpImmTime, tmpTime: TFMDateTime;
  x, tmpORECALLType, tmpORECALLTime: string;
begin
  x := GetLastCollectionTime;
  tmpORECALLType := Piece(x, U, 1);
  tmpORECALLTime := Piece(x, U, 2);
  if CollType = 'SP' then
    begin
      cboColltime.Visible    := False;
      txtImmedColl.Visible   := False;
      pnlCollTimeButton.Visible   := False;
      pnlCollTimeButton.TabStop := False;
      calCollTime.Visible    := True;
      calColltime.Enabled    := True;
      if FLastCollTime <> '' then
        begin
          calCollTime.Text := ValidCollTime(FLastColltime);
          if IsFMDateTime(calCollTime.Text) then
            begin
              calCollTime.Text := FormatFMDateTime('mmm dd,yy@hh:nn', StrToFMDateTime(calColltime.Text));
              calColltime.FMDateTime := StrToFMDateTime(FLastCollTime);
            end;
        end
      else if tmpORECALLTime <> '' then
        begin
          calCollTime.Text := ValidCollTime(tmpORECALLTime);
          if IsFMDateTime(calCollTime.Text) then
            begin
              calCollTime.Text := FormatFMDateTime('mmm dd,yy@hh:nn', StrToFMDateTime(calColltime.Text));
              calColltime.FMDateTime := StrToFMDateTime(tmpORECALLTime);
            end;
        end
      else if LRFDATE <> '' then
        calCollTime.Text     := LRFDATE
      else
        calCollTime.Text     := 'TODAY';
    end
  else if CollType = 'WC' then
    begin
      cboColltime.Visible    := False;
      txtImmedColl.Visible   := False;
      pnlCollTimeButton.Visible   := False;
      pnlCollTimeButton.TabStop := False;
      calCollTime.Visible    := True;
      calColltime.Enabled    := True;
      if FLastCollTime <> '' then
        begin
          calCollTime.Text := ValidColltime(FLastColltime);
          if IsFMDateTime(calCollTime.Text) then
            begin
              calCollTime.Text := FormatFMDateTime('mmm dd,yy@hh:nn', StrToFMDateTime(calColltime.Text));
              calColltime.FMDateTime := StrToFMDateTime(FLastCollTime);
            end;
        end
      else if tmpORECALLTime <> '' then
        begin
          calCollTime.Text := ValidColltime(tmpORECALLTime);
          if IsFMDateTime(calCollTime.Text) then
            begin
              calCollTime.Text := FormatFMDateTime('mmm dd,yy@hh:nn', StrToFMDateTime(calColltime.Text));
              calColltime.FMDateTime := StrToFMDateTime(tmpORECALLTime);
            end;
        end
      else if LRFDATE <> '' then
        calCollTime.Text     := LRFDATE
      else
        calCollTime.Text     := 'NOW';
    end
  else if CollType = 'LC' then
    begin
      cboColltime.Visible    := True;
      calCollTime.Visible    := False;
      calColltime.Enabled    := False;
      txtImmedColl.Visible   := False;
      pnlCollTimeButton.Visible   := False;
      pnlCollTimeButton.TabStop := False;
      with CtrlInits do SetControl(cboCollTime, 'Lab Collection Times');
      if Pos(U, FLastLabCollTime) > 0 then
        cboColltime.SelectByID(Piece(FLastLabCollTime, U, 1))
      else if FLastLabCollTime <> '' then
        cboCollTime.Text     := FLastLabCollTime
      else if (tmpORECALLTime <> '') and (tmpORECALLType = 'LC') then
        cboCollTime.Text     := MakeRelativeDateTime(StrToFMDateTime(tmpORECALLTime))
      else if LRFDATE <> '' then
        cboCollTime.Text     := LRFDATE
      else
        cboCollTime.ItemIndex := 0;
    end
  else if CollType = 'I' then
    begin
      cboColltime.Visible    := False;
      calCollTime.Visible    := False;
      calColltime.Enabled    := False;
      txtImmedColl.Visible   := True;
      pnlCollTimeButton.Visible   := True;
      pnlCollTimeButton.TabStop := True;
      tmpImmTime := GetDefaultImmCollTime;
      tmpTime := 0;
      if (FLastColltime <> '') then
        tmpTime := StrToFMDateTime(FLastColltime)
      else if (tmpORECALLTime <> '') then
        tmpTime := StrToFMDateTime(tmpORECALLTime)
      else if LRFDATE <> '' then
        tmpTime := StrToFMDateTime(LRFDATE);

      if tmpTime > tmpImmTime then
        begin
          calCollTime.FMDateTime := tmpTime;
          txtImmedColl.Text      := FormatFMDateTime('mmm dd,yy@hh:nn', tmpTime);
        end
      else
        begin
          calCollTime.FMDateTime := GetDefaultImmCollTime;
          txtImmedColl.Text      := FormatFMDateTime('mmm dd,yy@hh:nn', calCollTime.FMDateTime);
        end;
    end;
end;

procedure TfrmODBBank.LoadCollType(AComboBox:TORComboBox);
var
  i: integer;
begin
  with CtrlInits, cboCollType do
    begin
      SetControl(cboCollType, 'Collection Types');
      if not ALabTest.LabCanCollect then
        begin
          i := SelectByID('LC');
          if i > -1 then Items.Delete(i);
          i := SelectByID('I');
          if i > -1 then Items.Delete(i);
        end ;
      if LRFZX <> '' then
        begin
          if (LRFZX = 'LC') or (LRFZX = 'I') then
            begin
              if ALabTest.LabCanCollect then
                cboCollType.SelectByID(LRFZX)
              else
                cboCollType.SelectByID('WC');
            end
          else
            cboCollType.SelectByID(LRFZX);
        end
      else if FLastCollType <> '' then
        begin
          if (FLastCollType = 'LC') or (FLastCollType = 'I') then
            begin
              if ALabTest.LabCanCollect then
                cboCollType.SelectByID(FLastCollType)
              else
                cboCollType.SelectByID('WC');
            end
          else
            cboCollType.SelectByID(FLastCollType);
        end
      else if uDfltCollType <> '' then
        begin
          if (uDfltCollType = 'LC') or (uDfltCollType = 'I') then
            begin
              if ALabTest.LabCanCollect then
                cboCollType.SelectByID(uDfltCollType)
              else
                cboCollType.SelectByID('WC');
            end
          else
            cboCollType.SelectByID(uDfltCollType);
        end
      else if OrderForInpatient then
        begin
          if ALabTest.LabCanCollect then
            cboCollType.SelectByID('LC')
          else
            SelectByID('WC');
        end
      else
        cboCollType.SelectByID('SP');
    end;
  SetupCollTimes(cboCollType.ItemID);
end;

procedure  TfrmODBBank.ReadServerVariables;
begin
  LRFZX   := KeyVariable['LRFZX'];
  LRFSAMP := KeyVariable['LRFSAMP'];
  LRFSPEC := KeyVariable['LRFSPEC'];
  LRFDATE := KeyVariable['LRFDATE'];
  LRFURG  := KeyVariable['LRFURG'];
  LRFSCH  := KeyVariable['LRFSCH'];
end;

procedure TfrmODBBank.cboQuickClick(Sender: TObject);
begin
  inherited;
  SetOnQuickOrder;
end;

procedure TfrmODBBank.cboReasonsChange(Sender: TObject);
begin
  inherited;
  if (length(cboReasons.Text) > 75) then
    begin
      ShowMsg('REASON FOR REQUEST cannot be longer than 75 characters');
      cboReasons.Text := Copy(cboReasons.Text,0,75);
      Exit;
    end;
  if Length(cboReasons.Text) > 0 then Responses.Update('REASON', 1, cboReasons.Text, cboReasons.Text);
  memOrder.Text := Responses.OrderText;
end;

procedure TfrmODBBank.cboReasonsEnter(Sender: TObject);
begin
  inherited;
  if Length(cboReasons.Text) > 0 then
    uReason := cboReasons.Text;
end;

procedure TfrmODBBank.cboReasonsExit(Sender: TObject);
begin
  inherited;
  if Length(cboReasons.Text) > 0 then
    uReason := cboReasons.Text;
end;

procedure TfrmODBBank.cboAvailTestSelect(Sender: TObject);
var
  i: integer;
  text : string;
  ListItem: TListItem;
  aCollTime,aTypeScreen,aStr,aModifier,aSpecimen,aTestYes,x,aName,aTNSString: string;
  aList: TStringList;
  curAdd,AnInstance,aTNS,aTNSDays: Integer;
  sub,sub1: string;
  AResponse: TResponse;
begin
  if cboAvailTest.ItemID = '' then Exit;
  aList := TStringList.Create;
  try
    ALabTest := nil;
    aTypeScreen := '';
    aSpecimen := '^';
    aTestYes := '1';
    aModifier := '';
    changing := true;
    tQuantity.Text := '';
    sub1 := '';
    cboModifiers.ItemIndex := -1;
    DisableComponentControls;
    EnableDiagTestControls;
    LRORDERMODE := TORDER_MODE_DIAG;
    ALabTest := TLabTest.Create(cboAvailTest.ItemID, Responses);
    sub := GetSubtype(ALabTest.TestName);
    with CtrlInits do
        begin
          SetControl(cboCollType, 'Collection Types');
          LoadCollType(cboCollType);
          if FLastCollType <> '' then
            cboCollType.SelectByID(FLastCollType)
          else if uDfltCollType <> '' then
            cboCollType.SelectByID(uDfltCollType)
          else if OrderForInpatient then
            if (ALabTest.LabCanCollect) then
              cboCollType.SelectByID('LC')
            else
              cboCollType.SelectByID('WC')
          else
            cboCollType.SelectByID('SP');
          SetupCollTimes(cboCollType.ItemID);
        end;
    with cboAvailTest do
      begin
        if (Length(ItemID) = 0) or (ItemID = '0') then Exit;
        FLastLabID := ItemID ;
        FLastItemID := ItemID;
        for i := 0 to uSelectedItems.Count - 1 do
          if ItemID = piece(uSelectedItems[i],'^',2) then
            begin
              ItemIndex := -1;
              lvSelectionList.Items[i].Selected := true;
              lvSelectionListClick(self);
              Exit;
            end;
        Changing := True;
        Changing := False;
        ExtractTypeScreen(aList, uVBECList);
        if aList.Count > 0 then aTypeScreen := aList[0];
        aList.Clear;
        aTNSString := '';
        if (StrToInt(aTypeScreen) = cboAvailTest.ItemID) and (uTNSOrders.Count > 0) then
          begin
            for i := 0 to uTNSOrders.Count - 1 do
              aTNSString := aTNSString + CRLF + uTNSOrders[i];
            with Application do
              begin
                NormalizeTopMosts;
                aTNSDays := TNSDaysBack;
                aTNS :=
                  MessageBox(PChar(aTNSString + CRLF + CRLF +
                             'Do you wish to continue?'),
                             PChar('Type & Screen Entered in Past ' + IntToStr(TNSDaysBack) + ' Days'),
                             MB_YESNO);
                RestoreTopMosts;
                if aTNS = 7 then
                  begin
                    cboAvailTest.ItemIndex := -1;
                    exit;
                  end;
              end;
          end;
        if sub = 't' then with ALabTest do      //DIAGNOSTIC TEST
          begin
            if ObtainCollSamp then
              begin
              //For BloodBank orders, this condition should never occur
              end
            else
              begin
                with ALabTest do
                  with TCollSamp(CollSampList.Items[IndexOfCollSamp(CollSamp)]) do
                    begin
                      x := '' ;
                      for i := 0 to WardComment.Count-1 do
                      x := x + WardComment.strings[i]+#13#10 ;
                      pnlMessage.TabOrder := cboAvailTest.TabOrder + 1;
                      OrderMessage(x) ;
                    end ;
              end;
        end;
        Changing := False;
      end;
    if LRORDERMODE = TORDER_MODE_DIAG then
      begin
        if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
        with cboCollType do if Length(ItemID) > 0 then
          begin
            Responses.Update('COLLECT', 1, ItemID, ItemID) ;
            FLastCollType := ItemID;
          end;
        if Length(cboUrgency.Text) > 0 then Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text)
        else
          begin
            cboUrgency.ItemIndex := 1;
            Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
          end;
        if Length(memDiagComment.Text) > 0 then Responses.Update('COMMENT',1,memDiagComment.Text,memDiagComment.Text);
        if Length(cboReasons.Text) > 0 then Responses.Update('REASON',1,cboReasons.Text,cboReasons.Text);
        if cboCollType.ItemID = 'LC' then
          begin
            with cboCollTime do
              if Length(ItemID) > 0 then
                begin
                  Responses.Update('START', 1, Copy(ItemID, 2, 999), Copy(ItemID, 2, 999));
                  FLastLabCollTime := ItemID + U + Text;
                end
              else if Length(Text) > 0 then
                begin
                  Responses.Update('START', 1, ValidCollTime(Text), Text) ;
                  FLastLabCollTime := ValidCollTime(Text);
                end;
          end
          else
            begin
              with calCollTime do
                if FMDateTime > 0 then
                  begin
                    Responses.Update('START', 1, ValidCollTime(Text), Text);
                    FLastColltime := ValidCollTime(Text);
                  end
                else
                  begin
                    Responses.Update('START', 1, '', '') ;
                    FLastCollTime := '';
                  end;
            end;
          if Length(cboCollType.Text) > 0 then Responses.Update('COLLECT',1,cboCollType.ItemID,cboCollType.ItemID);
      end;
    if length(cboCollTime.ItemID) > 0 then aCollTime := cboCollTime.Items[cboCollTime.ItemIndex];
    uTestSelected := true;
    with lvSelectionList do
      begin
        ListItem := Items.Add;
        ListItem.Caption := piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',2);
        ListItem.SubItems.Add('');
        ListItem.SubItems.Add('');
        ListItem.SubItems.Add('');
        ListItem.SubItems.Add(piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',1));
        if piece(cboAvailTest.Items[cboAvailTest.ItemIndex],'^',1) = aTypeScreen then
          begin
            lblTNS.Caption := '';
            lblTNS.Visible := false;
            memMessage.Text := '';
            pnlMessage.Visible := false;
            uGetTnS := 0;
            pnlDiagnosticTests.Caption := 'Diagnostic Tests';
          end;
      end;
    aStr := aTestYes + '^' + IntToStr(aLabTest.TestID) + '^' + tQuantity.Text + '^' + aModifier + '^' + aSpecimen + '^' + aCollTime + '^' + cboCollType.Text + '^' + IntToStr(aLabTest.ItemID);  //aSpecimen has 2 pieces
    uSelectedItems.Add(aStr);
    CurAdd := 1;
    for i := 0 to uSelectedItems.Count - 1 do
      begin
        aName := lvSelectionList.Items[i].Caption;
        x := uSelectedItems[i];
        if piece(x,'^',1) = '1' then    //Diagnostic Test related fields
          begin
            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
          end;
        Inc(CurAdd);
      end;
    memOrder.Text := Responses.OrderText;
  finally
    aList.Free;
  end;
  edtResults.Height := 247;
  edtInfo.Height := 247;
  if lvSelectionList.Items.Count > 0 then
    begin
      pnlSelectedTests.Visible := True;
      cmdAccept.Visible := True;
      memOrder.Visible := True;
      GroupBox1.Visible := False;
    end;
end;

procedure TfrmODBBank.cboAvailCompSelect(Sender: TObject);
 var
  aList,aTests: TStringList;
  i,j,k,getTest,TestAdded: integer;
  text : string;
  aMSBOS,aMSBOSContinue,curAdd,AnInstance: integer;
  sub,sub1: string;
  AResponse: TResponse;
  ListItem: TListItem;
  aTypeScreen,aSpecimen,aTestYes,aStr,aMsg,aModifier,x,x1,aReason,aSurgery,aCollTime,aCollSave,aName: String;
begin
  if cboAvailComp.ItemID = '' then Exit;
  aList := TStringList.Create;
  aTests := TStringList.Create;
  sub1 := '';
  try
    DisableDiagTestControls;
    EnableComponentControls;
    if not(changing = true) then
      begin
        changing := true;
        tQuantity.Text := '';
        cboModifiers.ItemIndex := -1;
        changing := false;
      end;
    LRORDERMODE := TORDER_MODE_COMP;
    with cboAvailComp do
      begin
        if (Length(ItemID) = 0) or (ItemID = '0') then Exit;
        FLastLabID := ItemID ;
        FLastItemID := ItemID;
        for i := 0 to uSelectedItems.Count - 1 do
          if ItemID = piece(uSelectedItems[i],'^',2) then
            begin
              ItemIndex := -1;
              lvSelectionList.Items[i].Selected := true;
              lvSelectionListClick(self);
              Exit;
            end;
        ALabTest := TLabTest.Create(ItemID, Responses);
        sub := GetSubtype(ALabTest.TestName);
        Changing := False;
        StatusText('');
      end;
    //Check for and display any associated Lab Results
    aList.Clear;
    TestAdded := 0;
    getTest := 0;
    ExtractTests(aList, uVBECList);   //Get Results associated with ordered components
      for j := 0 to aList.Count - 1 do
        begin
          if StrToInt(piece(aList[j],'^',1)) = aLabTest.ItemID then
            begin
              if uTestsForResults.Count < 1 then getTest := 1;
              for k := 0 to uTestsForResults.Count - 1 do
                begin
                  if piece(uTestsForResults[k],'^',1) = piece(aList[j],'^',3) then
                    begin
                      getTest := 0;
                      break;
                    end
                  else getTest := 1;
                end;
              if getTest = 1 then
                begin
                  uTestsForResults.Add(piece(aList[j],'^',3));
                  TestAdded := 1;
                end;
            end;
        end;
      if TestAdded = 1 then
        begin
          edtResults.Clear;
          aTests.Clear;
          GetPatientBloodResults(aTests, Patient.DFN, uTestsForResults);
          QuickCopy(ATests,edtResults);
          if edtResults.Lines.Count > 0 then TabResults.Caption := 'Lab Results Available';
          uRaw.Clear;
          GetPatientBloodResultsRaw(uRaw, Patient.DFN, uTestsForResults);
        end;
      CurAdd := 1;
      if uRaw.Count > 0 then
      for j := 0 to uRaw.Count - 1 do
        begin
          if Length(uRaw[j]) > 0 then Responses.Update('RESULTS', CurAdd, uRaw[j], piece(uRaw[j],'^',1));
          Inc(CurAdd);
        end;
    aTypeScreen := '';
    aSpecimen := '^';
    aTestYes := '0';
    aReason := '';
    aSurgery := '';
    aCollTime := '';
    aList.Clear;
    ExtractTypeScreen(aList, uVBECList);
    if aList.Count > 0 then aTypeScreen := aList[0];
    aList.Clear;
    ExtractSpecimen(aList, uVBECList);
    if aList.Count > 0 then aSpecimen := aList[0];
    if length(cboModifiers.ItemID) > 0 then aModifier := cboModifiers.Items[cboModifiers.ItemIndex];
    if length(cboReasons.ItemID) > 0 then aReason := cboReasons.Items[cboReasons.ItemIndex];
    if length(cboSurgery.ItemID) > 0 then aSurgery := cboSurgery.Items[cboSurgery.ItemIndex];
    if length(cboCollTime.ItemID) > 0 then aCollTime := cboCollTime.Items[cboCollTime.ItemIndex];
    if Length(cboSurgery.ItemID) > 0 then
      begin
        aList.Clear;
        ExtractMSBOS(aList, uVBECList);    //Get maximum units for selected Surgey
        for i := 0 to aList.Count - 1 do
          begin
            if (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID)
             and (piece(aList[i],'^',3) = cboSurgery.Text) then
              begin
                aMSBOS := StrToInt(piece(aList[i],'^',4));
                if (aMSBOS > 0) and (Length(tQuantity.Text) > 0) and (StrToInt(tQuantity.Text) > aMSBOS) then
                  begin
                    with Application do
                    begin
                      NormalizeTopMosts;
                      aMSBOSContinue :=
                        MessageBox(PChar('The number of units ordered (' + tQuantity.Text +
                                   ') for ' + aLabTest.TestName + ' exceeds the maximum number of units ('
                                   + IntToStr(aMSBOS) +
                                   ') for the ' + cboSurgery.text +
                                   ' surgical procedure selected.' + CRLF + CRLF + 'Do you wish to continue?'),
                                   PChar('Maximum Number of Units Exceeded'),
                                   MB_YESNO);
                      RestoreTopMosts;
                    end;
                    if aMSBOSContinue = 7 then
                      begin
                        ShowMsg(cboAvailComp.Text + ' has NOT been added to this request.');
                        exit;
                      end;
                  end;
              end;
          end;
      end;
    if (uTNSOrders.Count < 1) then // SpecimenNeeded(aList, uVBECList, aLabTest.ItemID) then  //check to see if type and screen is needed
      begin
        uGetTnS := 1;
        for i := 0 to lvSelectionList.Items.Count - 1 do
          begin
            if lvSelectionList.Items[i].SubItems[3] = aTypeScreen then
              begin
                uGetTnS := 0;
                if length(cboUrgency.ItemID) > 0 then uDfltUrgency := cboUrgency.ItemID;
                lblTNS.Caption := '';
                lblTNS.Visible := false;
                memMessage.Text := '';
                pnlMessage.Visible := false;
                pnlDiagnosticTests.Caption := 'Diagnostic Tests';
                break;
              end;
          end;
      end;
    aList.Clear;
    ExtractSpecimens(aList, uVBECList);    //Get specimen values to pass back to Server
    for i := 0 to aList.Count - 1 do
      begin
        if (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID) then
          begin
            aSpecimen := piece(aList[i],'^',2) + '^' + aSpecimen;
            break;
          end;
      end;
    uComponentSelected := true;
    with lvSelectionList do
      begin
        ListItem := Items.Add;
        ListItem.Caption := piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',2);
        ListItem.SubItems.Add(tQuantity.Text);
        if length(cboModifiers.ItemID) > 0 then
          begin
            ListItem.SubItems.Add(cboModifiers.Items[cboModifiers.ItemIndex]);
            ListItem.SubItems.Add(IntToStr(cboModifiers.ItemIndex));
          end
          else
            begin
              ListItem.SubItems.Add('');
              ListItem.SubItems.Add('');
            end;
        ListItem.SubItems.Add(piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',1));
      end;
      aStr := aTestYes + '^' + IntToStr(aLabTest.TestID) + '^' + tQuantity.Text + '^' + aModifier + '^' + aSpecimen + '^' + IntToStr(aLabTest.ItemID);  //aSpecimen has 2 pieces additional pieces added for Tests
      uSelectedItems.Add(aStr);
      CurAdd := 1;
      for i := 0 to uSelectedItems.Count - 1 do
        begin
          aName := lvSelectionList.Items[i].Caption;
          x := uSelectedItems[i];
          if piece(x,'^',1) = '1' then    //Diagnostic Test related fields
            begin
              if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
            end
          else
            begin
              if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
              if Length(piece(x,'^',3)) > 0 then Responses.Update('QTY', CurAdd, piece(x,'^',3), piece(x,'^',3));
              if Length(piece(x,'^',4)) > 0 then Responses.Update('MODIFIER', CurAdd, piece(x,'^',4), piece(x,'^',4));
              if Length(piece(x,'^',5)) > 0 then Responses.Update('SPECSTS', CurAdd, pieces(x,'^',5,7), piece(x,'^',5));
              if Length(cboSurgery.Text) > 0 then Responses.Update('MISC',1,cboSurgery.Text,cboSurgery.Text);
              if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
              if Length(cboUrgency.Text) > 0 then Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text)
                else
                  begin
                    cboUrgency.ItemIndex := 1;
                    Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
                  end;
            end;
          Inc(CurAdd);
        end;
      memOrder.Text := Responses.OrderText;
  finally
    alist.Free;
    aTests.Free;
  end;
  aMsg := '';
  LRORDERMODE := TORDER_MODE_INFO;
  if uGetTnS = 1 then
    begin
      lblTNS.Caption := 'TYPE + SCREEN must be added to order';
      lblTNS.Visible := true;
      memMessage.Text := 'TYPE + SCREEN must be added to order';
      pnlMessage.Visible := true;
      pnlDiagnosticTests.Caption := 'Diagnostic Tests*';
    end;
  {if uGetTnS = 1 then
    begin
      if responses.QuickOrder < 1 then
        begin
          for i := 1 to cboAvailTest.Items.Count - 1 do
            begin
              if piece(cboAvailTest.Items[i],'^',1) = aTypeScreen then
                begin
                  if piece(aSpecimen,'^',1) = '1' then
                    begin
                      cboCollTime.Text := calWantTime.Text;
                      aCollSave := cboCollTime.Text + '^' + cboCollTime.ItemID + '^' + cboCollType.Text + '^' + cboCollType.ItemID;
                      cboCollTime.Text := '';
                      cboCollType.Text := '';
                      uSpecimen := 1;
                    end;
                  cboModifiers.Text := '';
                  cboAvailTest.SelectByID(aTypeScreen);
                  cboTests.SelectByID(aTypeScreen);
                  cboTestsClick(self);
                  //cboAvailTestSelect(Self);
                  uSpecimen := 0;
                  cboCollTime.Text := piece(aCollSave,'^',1);
                  cboCollType.Text := piece(aCollSave,'^',3);
                  aCollSave := '';
                  break;
                end;
            end;
          aMsg := 'An order for Type and Screen has been added to this request' + '.';
        end
        else
          begin
            lblTNS.Caption := 'TYPE + SCREEN must be added to order';
            lblTNS.Visible := true;
            memMessage.Text := 'TYPE + SCREEN must be added to order';
            memMessage.Visible := false;
            pnlMessage.Visible := true;
          end;
      end;
  if (uGetTnS = 1) then
    begin
      if length(aMsg) > 0 then aMsg := aMsg + crlf + crlf;
      ShowMsg(aMsg);
    end;  }
  edtResults.Height := 247;
  edtInfo.Height := 247;
  if lvSelectionList.Items.Count > 0 then
    begin
      pnlSelectedTests.Visible := True;
      cmdAccept.Visible := True;
      memOrder.Visible := True;
      GroupBox1.Visible := False;
    end;
  if tQuantity.CanFocus = true then tQuantity.SetFocus;
end;

procedure TfrmODBBank.DisableCommentPanels;
begin
  lblReqComment.Visible := False;
end;

procedure TfrmODBBank.DisableComponentControls;
begin
  lblQuantity.Enabled := false;
  tQuantity.Enabled := false;
  lblModifiers.Enabled := false;
  cboModifiers.Enabled := false;
  cboAvailComp.ItemIndex := -1;
end;

procedure TfrmODBBank.EnableComponentControls;
begin
  lblQuantity.Enabled := true;
  tQuantity.Enabled := true;
  lblModifiers.Enabled := true;
  cboModifiers.Enabled := true;
  if not(changing) then
    if not(uSelUrgency = 'PRE-OP') then
      if uSelUrgency = '' then
        if lvSelectionList.Items.Count < 1 then
          cboUrgency.SelectByID(IntToStr(uDfltUrgency));
  if cboUrgency.Text = 'PRE-OP' then
    begin
      lblSurgery.Enabled := true;
      cboSurgery.Enabled := true;
      lblSurgery.Caption := 'Surgery*';
    end
    else
      begin
        lblSurgery.Enabled := false;
        cboSurgery.Enabled := false;
        lblSurgery.Caption := 'Surgery';
      end;
  lblDiagComment.Enabled := true;
end;

procedure TfrmODBBank.DisableDiagTestControls;
begin
  lblCollTime.Enabled := false;
  calCollTime.Enabled := false;
  cboCollTime.Enabled := false;
  lblCollType.Enabled := false;
  cboCollType.Enabled := false;
  cmdImmedColl.Enabled := false;
  cboAvailTest.ItemIndex := -1;
  cboAvailTest.InitLongList('');
end;

procedure TfrmODBBank.EnableDiagTestControls;
begin
  lblCollTime.Enabled := true;
  calCollTime.Enabled := true;
  cboCollTime.Enabled := true;
  lblCollType.Enabled := true;
  cboCollType.Enabled := true;
  cmdImmedColl.Enabled := true;
  if not(changing) then
    if not(uSelUrgency = 'PRE-OP') then
      if uSelUrgency = '' then
        if lvSelectionList.Items.Count < 1 then
          cboUrgency.SelectByID(IntToStr(uDfltUrgency));
end;

procedure TfrmODBBank.LoadRequiredComment(CmtType: integer);
begin
  DisableCommentPanels;
  lblReqComment.Visible := True ;
end;

procedure TfrmODBBank.DetermineCollectionDefaults(Responses: TResponses);
var
  RespCollect, RespStart: TResponse;
begin
  if ALabTest = nil then exit;
  if ALabTest.LabSubscript = 'BB' then exit;
  calCollTime.Clear;
  cboCollTime.Clear;
  calCollTime.Enabled := True;
  lblCollTime.Enabled := True;
  cboColltime.Enabled := True;
  with Responses, ALabTest do
    begin
      RespCollect := FindResponseByName('COLLECT',1);
      RespStart   := FindResponseByName('START'  ,1);
      if (RespCollect <> nil) then with RespCollect do
        begin
          if IValue = 'LC' then
            begin
              if not LabCanCollect then
                begin
                 cboCollType.SelectByID('WC');
                 SetupCollTimes('WC');
                end
              else   //  if LabCanCollect
                begin
                 cboCollType.SelectByID('LC');
                 SetupCollTimes('LC');
                 CtrlInits.SetControl(cboCollTime, 'Lab Collection Times') ;
                 if RespStart <> nil then
                   begin
                     cboCollTime.SelectByID('L' + RespStart.IValue);
                     if cboCollTime.ItemIndex < 0 then
                       cboCollTime.Text := RespStart.IValue;
                   end;
                end;
            end
          else    //  if IValue <> 'LC'
            begin
              cboCollType.SelectByID(IValue) ;
              SetupCollTimes(IValue);
              if RespStart <> nil then
                begin
                  if ContainsAlpha(RespStart.IValue) then
                    calColltime.Text := RespStart.IValue
                  else
                    calColltime.FMDateTime := StrToFMDateTime(RespStart.IValue);
                end;
            end ;
          if IValue = 'I' then
            if not LabCanCollect then
              begin
               cboCollType.SelectByID('WC');
               SetupCollTimes('WC');
              end
            else
              begin
                calCollTime.Enabled := False;
                if RespStart <> nil then txtImmedColl.Text := RespStart.EValue;
              end;
        end
      else   // if (RespCollect = nil)
        LoadCollType(cbocollType);
    end;
end;

procedure TfrmODBBank.cboAvailTestExit(Sender: TObject);
begin
  inherited;
  if (Length(cboAvailTest.ItemID) = 0) or (cboAvailTest.ItemID = '0') then Exit;
  if cboAvailTest.ItemID = FLastLabID then Exit;
  cboAvailTestSelect(cboAvailTest);
  cboAvailTest.SetFocus;
  PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmODBBank.cboAvailCompChange(Sender: TObject);
begin
  inherited;
  changing := true;
  changing := false;
end;

procedure TfrmODBBank.cboAvailCompExit(Sender: TObject);
begin
  inherited;
  if (Length(cboAvailComp.ItemID) = 0) or (cboAvailComp.ItemID = '0') then Exit;
  if cboAvailComp.ItemID = FLastLabID then Exit;
  cboAvailCompSelect(cboAvailComp);
  cboAvailComp.SetFocus;
  PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmODBBank.cboAvailTestNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
begin
  cboAvailTest.ForDataUse(SubsetOfOrderItems(StartFrom, Direction, FVbecLookup));
end;

procedure TfrmODBBank.cboAvailCompNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
begin
  cboAvailComp.ForDataUse(SubsetOfOrderItems(StartFrom, Direction, FVbecLookup));
end;

procedure TfrmODBBank.cmdImmedCollClick(Sender: TObject);
var
  ImmedCollTime: string;
begin
  inherited;
  ImmedCollTime := SelectImmediateCollectTime(Font.Size, txtImmedColl.Text);
  if ImmedCollTime <> '-1' then
    begin
      txtImmedColl.Text := ImmedCollTime;
      calCollTime.FMDateTime := StrToFMDateTime(ImmedCollTime);
    end
  else
    begin
      txtImmedColl.Clear;
      calCollTime.Clear;
    end;
end;

procedure TfrmODBBank.pgeProductChange(Sender: TObject);
begin
  inherited;
  case pgeProduct.TabIndex of
  TI_COMPONENT :     begin
                  memOrder.Visible := true;
                  cmdAccept.Visible := true;
                  pnlSelectedTests.Visible := true;
                  lvSelectionList.Width := lvSelectionList.Width + 1; //added to fix font resize issue - funky column display
                end;
  TI_INFO :     begin
                  if lvSelectionList.Items.Count > 0 then
                  begin
                    memOrder.Visible := true;
                    cmdAccept.Visible := true;
                    pnlSelectedTests.Visible := true;
                  end
                  else
                  begin
                    memOrder.Visible := false;
                    cmdAccept.Visible := false;
                    pnlSelectedTests.Visible := false;
                  end;
                end;
  TI_RESULTS :  begin
                  if lvSelectionList.Items.Count > 0 then
                  begin
                    memOrder.Visible := true;
                    cmdAccept.Visible := true;
                    pnlSelectedTests.Visible := true;
                  end
                  else
                  begin
                    memOrder.Visible := false;
                    cmdAccept.Visible := false;
                    pnlSelectedTests.Visible := false;
                  end;
                end;
  end; {case}
end;

procedure TfrmODBBank.cboCollTimeChange(Sender: TObject);
var
  CollType: string;
const
  TX_BAD_TIME         = ' is not a routine lab collection time.' ;
  TX_BAD_TIME_CAP     = 'Invalid Time';
begin
  CollType := 'LC';
  with cboCollTime do
    begin
      if ItemID = 'LO' then
        begin
          ItemIndex := -1;
          Text := GetFutureLabTime(FMToday);
        end;
    end;
  cboCollType.SelectByID(CollType);
  if uSelectedItems.Count > 0 then
    begin
      with cboCollTime do
        if Length(ItemID) > 0 then
          begin
            Responses.Update('START', 1, Copy(ItemID, 2, 999), Copy(ItemID, 2, 999));
            FLastLabCollTime := ItemID + U + Text;
          end
        else if Length(Text) > 0 then
          begin
            Responses.Update('START', 1, ValidCollTime(Text), Text) ;
            FLastLabCollTime := ValidCollTime(Text);
          end;
    end;
end;

procedure TfrmODBBank.cboCollTypeChange(Sender: TObject);
begin
  if (ALabTest = nil) or Changing or (cboCollType.ItemID = '') then exit;
  if (cboCollType.ItemID = 'I') and (not ALabTest.LabCanCollect) then
    begin
      InfoBox(TX_NO_IMMED, TX_NO_IMMED_CAP, MB_OK or MB_ICONWARNING);
      cboCollType.ItemIndex := -1;
      Exit;
    end;
  if cboCollType.ItemID = 'I' then
  begin
    cboCollTime.ItemIndex := -1;
    cboCollTime.Text := 'NOW';
    calCollTime.Text := 'NOW';
  end;
  SetupCollTimes(cboCollType.ItemID);
  if Length(cboCollType.Text) > 0 then Responses.Update('COLLECT',1,cboCollType.ItemID,cboCollType.ItemID);
  FLastCollType := cboCollType.ItemID;
  calCollTimeChange(self);
end;

procedure TfrmODBBank.cboModifiersChange(Sender: TObject);
var
  i: integer;
  ListItem: TListItem;
  x,q,m: string;
begin
  inherited;
  if changing = true then Exit;
  if (cboAvailComp.ItemIndex <> -1) and (uSelectedItems.Count > 0) then
    begin
      for i := 0 to lvSelectionList.Items.Count - 1 do
        begin
          x := uSelectedItems[i];
          m := piece(x,'^',4);
          q := piece(x,'^',3);
          if lvSelectionList.Items[i].Caption = piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',2) then
            begin
              ListItem := lvSelectionList.Items[i];
              ListItem.SubItems.Clear;
              ListItem.SubItems.Add(q);
              if length(cboModifiers.ItemID) > 0 then
                begin
                  ListItem.SubItems.Add(cboModifiers.Items[cboModifiers.ItemIndex]);
                  ListItem.SubItems.Add(IntToStr(cboModifiers.ItemIndex));
                end
                else
                  begin
                    ListItem.SubItems.Add('');
                    ListItem.SubItems.Add('');
                  end;
              ListItem.SubItems.Add(piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',1));
              Responses.Update('MODIFIER', (i+1), cboModifiers.Text, cboModifiers.Text);
              Break;
            end;
        end;
    end;
  if Length(cboModifiers.Text) > 0 then
    begin
      memOrder.Text := Responses.OrderText;
    end;
end;

procedure TfrmODBBank.LoadModifiers(AComboBox:TORComboBox);
var
  i: integer;
begin
  with AComboBox do
    begin
      Clear;
      for i := 0 to uModifierList.Count - 1 do
           Items.Add(uModifierList[i]);
    end;
end;

procedure TfrmODBBank.LoadReasons(AComboBox:TORComboBox);
var
  i: integer;
begin
  with AComboBox do
    begin
      Clear;
      for i := 0 to uReasonsList.Count - 1 do
           Items.Add(uReasonsList[i]);
    end;
end;

procedure TfrmODBBank.LoadUrgencies(AComboBox:TORComboBox);
var
  i: integer;
begin
  with AComboBox do
    begin
      Clear;
      for i := 0 to uUrgencyList.Count - 1 do
         if (piece(uUrgencyList[i],'^',2) = 'STAT') and (StatAllowed(Patient.DFN) = false) then
           Continue
         else
           Items.Add(uUrgencyList[i]);
    end;
end;

procedure TfrmODBBank.lvSelectionListClick(Sender: TObject);
var
  ListItem: TListItem;
  x,y: string;
  i,j: integer;
begin
  inherited;
  if lvSelectionList.Selected = nil then Exit;
  ListItem := lvSelectionList.Selected;
  changing := true;
  tQuantity.Text := '';
  cboModifiers.ItemIndex := -1;
  i := lvSelectionList.ItemIndex;
  j := 0;
  if cboCollType.ItemID = 'LC' then
    begin
      if FLastLabCollTime <> '' then
        cboCollTime.SelectByID(piece(FLastLabCollTime,'^',1));
    end
  else
    begin
      if FLastCollTime = 'TODAY' then
        calCollTime.Text := FLastCollTime
      else if FLastCollTime = 'NOW' then
        calCollTime.Text := FLastCollTime
      else if FLastCollTime <> '' then
        calCollTime.Text := FormatFMDateTime('mmm dd,yyyy@hh:nn',StrToFMDateTime(FLastCollTime));
    end;
  if FLastCollType <> '' then
    cboCollType.SelectByID(FLastCollType);
  if uSelectedItems.Count > 0 then
    begin
      x := uSelectedItems[i];
      ALabTest := TLabTest.Create(piece(uSelectedItems[i],'^',2), Responses);
      if not(piece(x,'^',2) = '') then j := StrToInt(piece(x,'^',2));
      if not(piece(x,'^',1) = '1') and (j > 0) then //Components
        begin
          DisableDiagTestControls;
          EnableComponentControls;
          y := ListItem.SubItems[2];
          changing := true;
          cboModifiers.Text := '';
          cboAvailComp.SelectByIEN(j);
          tQuantity.Text := ListItem.SubItems[0];
          changing := false;
          if y <> '' then cboModifiers.ItemIndex := StrToInt(y);
        end
      else                            //Diagnostic Tests
        begin
          DisableComponentControls;
          EnableDiagTestControls;
          cboAvailTest.SelectByIEN(j);
        end;
    end;
  changing := false;
end;

procedure TfrmODBBank.memDiagCommentChange(Sender: TObject);
begin
  inherited;
  if (length(memDiagComment.Text) > 250) then
    begin
      ShowMsg('COMMENT cannot be longer than 250 characters');
      memDiagComment.Text := Copy(memDiagComment.Text,0,250);
      Exit;
    end;
  if lvSelectionList.Items.Count < 1 then Exit;

  if uSelectedItems = nil then Exit;
  
  if uSelectedItems.Count > 0 then
    Responses.Update('COMMENT',1,memDiagComment.Text,memDiagComment.Text);
  memOrder.Text := Responses.OrderText;
end;

procedure TfrmODBBank.FormDestroy(Sender: TObject);
begin
  inherited;
  uSelectedItems.Free;
  uVBECList.Free;
  uTestsForResults.Free;
  uUrgencyList.Free;
  uTNSOrders.Free;
  uModifierList.Free;
  uReasonsList.Free;
  uRaw.Free;
end;

procedure TfrmODBBank.btnRemoveClick(Sender: TObject);
var
  i,j,curAdd: integer;
  x, aName, aModifier, aReason, aTypeScreen: string;
  aList: TStringList;
  aSel, aSelTst : boolean;
begin
  inherited;
  aList := TStringList.Create;
  try
    curAdd := 1;
    aModifier := '';
    aReason := '';
    aTypeScreen := '';
    aSel := false;
    aSelTst := false;
    ExtractTypeScreen(aList, uVBECList);
    if aList.Count > 0 then aTypeScreen := aList[0];
    aList.Clear;
    if length(cboModifiers.ItemID) > 0 then aModifier := cboModifiers.Items[cboModifiers.ItemIndex];
    if length(cboReasons.ItemID) > 0 then aReason := cboReasons.Items[cboReasons.ItemIndex];
    if lvSelectionList.Items.Count < 1 then
      begin
        ShowMsg('There is nothing in the list to remove.');
        exit;
      end;
    cboAvailComp.ItemIndex := -1;
    tQuantity.Text := '';
    cboAvailTest.ItemIndex := -1;
    uGetTnS := 0;
    lblTNS.Caption := '';
    lblTNS.Visible := false;
    memMessage.Text := '';
    pnlMessage.Visible := false;
    pnlDiagnosticTests.Caption := 'Diagnostic Tests';
    with lvSelectionList do
      begin
        for i := lvSelectionList.Items.Count - 1 downto 0 do
          begin
            if lvSelectionList.Items[i].Selected = true then
              begin
                aSel := true;
                for j := uSelectedItems.Count - 1 downto 0 do
                  if lvSelectionList.Items[i].SubItems[3] = piece(uSelectedItems[j],'^',2) then
                    begin
                      {if (uGetTnS = 1) and (lvSelectionList.Items[i].SubItems[3] = aTypeScreen) then
                        begin
                          uGetTnS := 1;
                          lblTNS.Caption := 'TYPE+SCREEN must be added to order';
                          lblTNS.Visible := true;
                          memMessage.Text := 'TYPE + SCREEN must be added to order';
                          //memMessage.Visible := true;
                          pnlMessage.Visible := true;
                          pnlDiagnosticTests.Caption := 'Diagnostic Tests*';
                        end; }
                      uSelectedItems.Delete(j);
                      lvSelectionList.Items[i].Delete;
                      break;
                    end;
              end;
          end;
      end;
    for i := uSelectedItems.Count - 1 downto 0 do
      begin
        if (not(piece(uSelectedItems[i],'^',1) = '1')) and (uTNSOrders.Count < 1) then // and (SpecimenNeeded(aList, uVBECList, StrToInt(piece(uSelectedItems[i],'^',9)))) then
          begin
            uGetTnS := 1;
            lblTNS.Caption := 'TYPE+SCREEN must be added to order';
            lblTNS.Visible := true;
            memMessage.Text := 'TYPE + SCREEN must be added to order';
            //memMessage.Visible := true;
            pnlMessage.Visible := true;
            pnlDiagnosticTests.Caption := 'Diagnostic Tests*';
            break;
          end;
      end;
      
    if (aSel = false) and (lvSelectionList.Items.Count > 0) then
      begin
        ShowMsg('Please select an item from the list to be removed.');
        exit;
      end;
    Responses.Clear;
    if lvSelectionList.Items.Count < 1 then
      begin
        cboReasons.ItemIndex := -1;
        memDiagComment.Text := '';
        cboSurgery.ItemIndex := -1;
        cboUrgency.ItemIndex := -1;
        cboCollType.ItemIndex := -1;
        cboCollTime.ItemIndex := -1;
        cboQuick.ItemIndex := -1;
        calCollTime.Text := '';
      end;
    for i := 0 to uSelectedItems.Count - 1 do
      begin
        aName := lvSelectionList.Items[i].Caption;
        x := uSelectedItems[i];
        if piece(x,'^',1) = '1' then    //Diagnostic Test related fields
          begin
            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
            aSelTst := true;
          end
        else
          begin
            if Length(piece(x,'^',2)) > 0 then Responses.Update('ORDERABLE', CurAdd, piece(x,'^',2), aName);
            if Length(piece(x,'^',3)) > 0 then Responses.Update('QTY', CurAdd, piece(x,'^',3), piece(x,'^',3));
            if Length(piece(x,'^',4)) > 0 then Responses.Update('MODIFIER', CurAdd, piece(x,'^',4), aModifier);
            if Length(piece(x,'^',5)) > 0 then Responses.Update('SPECSTS', CurAdd, pieces(x,'^',5,7), piece(x,'^',5));
            cboModifiers.ItemIndex := -1;
            cboAvailComp.ItemIndex := -1;
            tQuantity.Text := '';
          end;
        Inc(CurAdd);
      end;
    if aSelTst = false then
      begin
        cboCollType.ItemIndex := -1;
        cboCollTime.ItemIndex := -1;
        calCollTime.Text := '';
      end;
    if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
    if cboCollType.ItemID = 'LC' then
      begin
        with cboCollTime do
          if Length(ItemID) > 0 then
            begin
              Responses.Update('START', 1, Copy(ItemID, 2, 999), Copy(ItemID, 2, 999));
              FLastLabCollTime := ItemID + U + Text;
            end
          else if Length(Text) > 0 then
            begin
              Responses.Update('START', 1, ValidCollTime(Text), Text) ;
              FLastLabCollTime := ValidCollTime(Text);
            end;
      end
    else
      begin
        with calCollTime do
          if FMDateTime > 0 then
            begin
              Responses.Update('START', 1, ValidCollTime(Text), Text);
              FLastColltime := ValidCollTime(Text);
            end
          else
            begin
              Responses.Update('START', 1, '', '') ;
              FLastCollTime := '';
            end;
      end;
    with cboCollType do if Length(ItemID) > 0 then
      begin
        Responses.Update('COLLECT', 1, ItemID, ItemID) ;
        FLastCollType := ItemID;
      end;
    if Length(cboUrgency.Text) > 0 then Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
    if Length(memDiagComment.Text) > 0 then Responses.Update('COMMENT',1,memDiagComment.Text,memDiagComment.Text);
    if Length(cboSurgery.Text) > 0 then Responses.Update('MISC',1,cboSurgery.Text,cboSurgery.Text);
    if Length(cboReasons.Text) > 0 then Responses.Update('REASON',1,cboReasons.Text,cboReasons.Text);
    if chkConsent.Checked = true then Responses.Update('YN',1,'1','Yes');
    memOrder.Text := Responses.OrderText;
    CurAdd := 1;
    if uRaw.Count > 0 then
      for j := 0 to uRaw.Count - 1 do
        begin
          if Length(uRaw[j]) > 0 then Responses.Update('RESULTS', CurAdd, uRaw[j], piece(uRaw[j],'^',1));
          Inc(CurAdd);
        end;
    if uSelectedItems.Count < 1 then
      begin
        uGetTnS := 0;
        lblTNS.Caption := '';
        lblTNS.Visible := false;
        memMessage.Text := '';
        pnlMessage.Visible := false;
        GroupBox1.Visible := true;
        pnlDiagnosticTests.Caption := 'Diagnostic Tests';
      end;
  finally
    aList.Free;
  end;
end;

procedure TfrmODBBank.btnUpdateCommentsClick(Sender: TObject);
begin
  inherited;
  pnlComments.Visible := false;
  pnlComments.SendToBack;
  Responses.Update('COMMENT',1,memDiagComment.Text,memDiagComment.Text);
  memOrder.Text := Responses.OrderText;
end;

procedure TfrmODBBank.btnCancelCommentClick(Sender: TObject);
begin
  inherited;
  pnlComments.Visible := false;
  pnlComments.SendToBack;
end;

procedure TfrmODBBank.btnRemoveAllClick(Sender: TObject);
begin
  inherited;
  if lvSelectionList.Items.Count < 1 then
    begin
      ShowMsg('There is nothing in the list to remove.');
      exit;
    end;
  lvSelectionList.Clear;
  uSelectedItems.Clear;
  uTestsForResults.Clear;
  uRaw.Clear;
  uGetTnS := 0;
  lblTNS.Caption := '';
  lblTNS.Visible := false;
  memMessage.Text := '';
  pnlMessage.Visible := false;
  InitDialog;
  cboModifiers.ItemIndex := -1;
  cboAvailTest.ItemIndex := -1;
  cboAvailComp.ItemIndex := -1;
  cboSurgery.ItemIndex := -1;
  cboUrgency.ItemIndex := -1;
  cboReasons.ItemIndex := -1;
  cboCollType.ItemIndex := -1;
  cboCollTime.ItemIndex := -1;
  cboQuick.ItemIndex := -1;
  calWantTime.Text := '';
  memDiagComment.Text := '';
  GroupBox1.Visible := true;
  tQuantity.Text := '';
  FLastCollType := '';
  FLastCollTime := '';
  FLastLabCollTime := '';
  txtImmedColl.Text := '';
end;

procedure TfrmODBBank.cmdAcceptClick(Sender: TObject);
var
  i: integer;
  Comp: boolean;
const
  Txt1 = 'This order can not be saved for the following reason(s):';
  Txt2 = #13+#13+'An order for TYPE and SCREEN must be created with this order set.';
begin
  if not ValidAdd then Exit;
  if uGetTnS = 1 then
    begin
      MessageDlg(Txt1+Txt2, mtWarning,[mbOK],0);
      Exit;
    end;
  Comp := false;
  if uSelectedItems.Count > 0 then
    begin
      for i := 0 to uSelectedItems.Count - 1 do
        if not (piece(uSelectedItems[i],'^',1) = '1') then
          begin
            Comp := true;
            Break;
          end;
    end;
  if Comp = true then
    begin
      if NursAdminSuppress = true then
        ShowMsg('The nursing blood administration order must be entered separately' + '.');
    end;
  inherited;
end;

procedure TfrmODBBank.calWantTimeChange(Sender: TObject);
begin
  inherited;
  if uSelectedItems.Count > 0 then
    begin
      with calWantTime do if not Changing then
        begin
          if FMDateTime = 0 then
            begin
              ShowMsg('Invalid Date/Time entered');
              Changing := true;
              calWantTime.Text := '';
              Changing := false;
              Exit;
            end
          else
            begin
              // date/time was entered
              if (UpperCase(Text) <> 'NOW') and not(Trunc(FMNow) = Trunc(FMDateTime)) and (FMDateTime < FMNow) then
                begin
                  ShowMsg('Date/Time Wanted must be a future Date/Time');
                  Changing := true;
                  calWantTime.Text := '';
                  Changing := false;
                  Exit;
                end;
            end;
        end;
      if Length(calWantTime.Text) > 0 then Responses.Update('DATETIME',1,ValidCollTime(calWantTime.Text),calWantTime.Text);
      memOrder.Text := Responses.OrderText;
    end;
end;

procedure TfrmODBBank.chkConsentClick(Sender: TObject);
begin
  inherited;
  if uSelectedItems.Count > 0 then
    begin
      if chkConsent.Checked = true then Responses.Update('YN',1,'1','Yes');
      memOrder.Text := Responses.OrderText;
    end;
end;

procedure TfrmODBBank.cboUrgencyChange(Sender: TObject);
begin
  inherited;
  if Length(cboUrgency.Text) > 0 then
    begin
      Responses.Update('URGENCY',1,cboUrgency.ItemID,cboUrgency.Text);
      uSelUrgency := cboUrgency.Text;
      if cboUrgency.Text = 'PRE-OP' then
        begin
          lblSurgery.Enabled := true;
          cboSurgery.Enabled := true;
          lblSurgery.Caption := 'Surgery*';
        end
      else
        begin
          lblSurgery.Enabled := false;
          cboSurgery.Enabled := false;
          lblSurgery.Caption := 'Surgery';
          cboSurgery.ItemIndex := -1;
          Responses.Update('MISC',1,cboSurgery.Text,cboSurgery.Text);
        end;
    end
  else
    cboUrgency.SelectByID(IntToStr(uDfltUrgency));
  memOrder.Text := Responses.OrderText;
end;

procedure TfrmODBBank.cboUrgencyExit(Sender: TObject);
begin
  inherited;
  if Length(cboUrgency.Text) < 1 then
    cboUrgency.SelectByID(IntToStr(uDfltUrgency));
end;

procedure TfrmODBBank.cboSurgeryChange(Sender: TObject);
var
  aList: TStringList;
  i,j,aMSBOS,aMSBOSContinue: integer;
  x: string;
  handled: boolean;
begin
  inherited;
  aList := TStringList.Create;
  handled := false;
  try
    if (Length(cboSurgery.ItemID) > 0) and (Length(tQuantity.Text) > 0) then
      begin
        aList.Clear;
        ExtractMSBOS(aList, uVBECList);    //Get maximum units for selected Surgey
        for i := 0 to aList.Count - 1 do
          begin
            if (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID)
             and (piece(aList[i],'^',3) = cboSurgery.Text) then
              begin
                aMSBOS := StrToInt(piece(aList[i],'^',4));
                if (aMSBOS > 0) and (StrToInt(tQuantity.Text) > aMSBOS) then
                  begin
                    with Application do
                    begin
                      NormalizeTopMosts;
                      aMSBOSContinue :=
                        MessageBox(PChar('The number of unit Quantity selected (' + tQuantity.Text +
                                   ') for ' + aLabTest.TestName + ' exceeds the maximum number of units ('
                                   + IntToStr(aMSBOS) +
                                   ') for the ' + cboSurgery.text +
                                   ' surgical procedure selected.' + CRLF + CRLF + 'Continue to order ' + tQuantity.Text + ' units?'),
                                   PChar('Maximum Number of Units Exceeded'),
                                   MB_YESNO);
                      RestoreTopMosts;
                    end;
                    if aMSBOSContinue = 7 then
                      begin
                        ShowMsg('Please enter a new quantity for ' + cboAvailComp.Text);
                        tQuantity.Text := '0';
                        tQuantity.SelLength := 2;
                        tQuantity.SelectAll;
                        break;
                      end;
                  end;
                handled := true;
                break;
              end;
          end;
      end;
    if (handled = false) and (Length(cboSurgery.ItemID) > 0) and (uSelectedItems.Count > 0) then
      begin
        aList.Clear;
        ExtractMSBOS(aList, uVBECList);    //Get maximum units for selected Surgey
        for j := 0 to uSelectedItems.Count - 1 do
          begin
            ALabTest := TLabTest.Create(piece(uSelectedItems[j],'^',2), Responses);
            for i := 0 to aList.Count - 1 do
              begin
                if (piece(uSelectedItems[j],'^',1) = '0')
                 and (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID)
                 and (piece(aList[i],'^',3) = cboSurgery.Text) then
                  begin
                    aMSBOS := StrToInt(piece(aList[i],'^',4));
                    if (aMSBOS > 0) and (length(piece(uSelectedItems[j],'^',3)) > 0) and (StrToInt(piece(uSelectedItems[j],'^',3)) > aMSBOS) then
                      begin
                        with Application do
                        begin
                          NormalizeTopMosts;
                          aMSBOSContinue :=
                            MessageBox(PChar('The number of unit Quantity selected (' + piece(uSelectedItems[j],'^',3) +
                               ') for ' + lvSelectionList.Items[j].Caption + ' exceeds the maximum number of units ('
                               + IntToStr(aMSBOS) +
                               ') for the ' + cboSurgery.text +
                               ' surgical procedure selected.' + CRLF + CRLF + 'Continue to order ' + piece(uSelectedItems[j],'^',3) + ' units?'),
                               PChar('Maximum Number of Units Exceeded'),
                               MB_YESNO);
                          RestoreTopMosts;
                        end;
                        if aMSBOSContinue = 7 then
                          begin
                            ShowMsg('Please enter a new quantity for ' + lvSelectionList.Items[j].Caption);
                            tQuantity.Text := '0';
                            tQuantity.SelLength := 2;
                            tQuantity.SelectAll;
                            x := uSelectedItems[j];
                            SetPiece(x,U,3,'');
                            uSelectedItems[j] := x;
                            lvSelectionList.Items[j].SubItems[0] := '';
                            RePaint;
                            break;
                          end;
                      end;
                    break;
                  end;
              end;
          end;
      end;
    if uSelectedItems.Count > 0 then
      if Length(cboSurgery.Text) > 0 then
        Responses.Update('MISC',1,cboSurgery.Text,cboSurgery.Text);
    uSelSurgery := 0;
    if Length(cboSurgery.Text) > 0 then
      begin
        if length(cboSurgery.ItemID) > 0 then uSelSurgery := cboSurgery.ItemID;
        cboReasons.Text := cboSurgery.Text;
        Responses.Update('REASON',1,cboReasons.Text,cboReasons.Text);
      end;
    memOrder.Text := Responses.OrderText; 
    finally
      aList.Free;
    end;
end;

procedure TfrmODBBank.cboSurgeryClick(Sender: TObject);
begin
  inherited;
  if Length(cboSurgery.Text) > 0 then uSelSurgery := cboSurgery.ItemID;
end;

procedure TfrmODBBank.tQuantityChange(Sender: TObject);
var
  aList: TStringList;
  i,aMSBOS,aMSBOSContinue: integer;
  ListItem: TListItem;
  x,m: string;
begin
  inherited;
  if changing = true then Exit;
  aList := TStringList.Create;
  if Length(tQuantity.Text) > 0 then
    begin
      if Length(tQuantity.Text) > 2 then
        begin
          ShowMsg('Invalid entry. Please select a numeric value <100');
          tQuantity.Text := '';
          Exit;
        end;
      if StrToInt(tQuantity.Text) > 100 then
        begin
          ShowMsg('Quantity too high. Please select a value <100');
          tQuantity.Text := Copy(tQuantity.Text,0,1);
          Exit;
        end;
    end;
  try
    if (Length(cboSurgery.ItemID) > 0) and (Length(tQuantity.Text) > 0) then
      begin
        aList.Clear;
        ExtractMSBOS(aList, uVBECList);    //Get maximum units for selected Surgery
        for i := 0 to aList.Count - 1 do
          begin
            if (StrToInt(piece(aList[i],'^',1)) = aLabTest.ItemID)
             and (piece(aList[i],'^',3) = cboSurgery.Text) then
              begin
                aMSBOS := StrToInt(piece(aList[i],'^',4));
                if (aMSBOS > 0) and (StrToInt(tQuantity.Text) > aMSBOS) then
                  begin
                    with Application do
                    begin
                      NormalizeTopMosts;
                      aMSBOSContinue :=
                        MessageBox(PChar('The number of units ordered (' + tQuantity.Text +
                                   ') for ' + aLabTest.TestName + ' exceeds the maximum number of units ('
                                   + IntToStr(aMSBOS) +
                                   ') for the ' + cboSurgery.text +
                                   ' surgical procedure selected.' + CRLF + CRLF + 'Do you wish to continue?'),
                                   PChar('Maximum Number of Units Exceeded'),
                                   MB_YESNO);
                      RestoreTopMosts;
                    end;
                    if aMSBOSContinue = 7 then
                      begin
                        ShowMsg('Please enter a new quantity for ' + cboAvailComp.Text);
                        tQuantity.Text := '0';
                        tQuantity.SelLength := 2;
                        tQuantity.SelectAll;
                        break;
                      end;
                  end;
                break;
              end;
          end;
      end;
    if (cboAvailComp.ItemIndex <> -1) and (uSelectedItems.Count > 0) then
      for i := 0 to lvSelectionList.Items.Count - 1 do
        begin
          if lvSelectionList.Items[i].Caption = piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',2) then
            begin
              x := uSelectedItems[i];
              m := piece(x,'^',4);
              ListItem := lvSelectionList.Items[i];
              ListItem.SubItems.Clear;
              ListItem.SubItems.Add(tQuantity.Text);
              SetPiece(x,U,3,tQuantity.Text);
              Responses.Update('QTY', (i+1), tQuantity.Text, tQuantity.Text);
              uSelectedItems[i] := x;
              if length(cboModifiers.ItemID) > 0 then
                begin
                  ListItem.SubItems.Add(cboModifiers.Items[cboModifiers.ItemIndex]);
                  ListItem.SubItems.Add(IntToStr(cboModifiers.ItemIndex));
                end
                else
                  begin
                    ListItem.SubItems.Add('');
                    ListItem.SubItems.Add('');
                  end;

              ListItem.SubItems.Add(piece(cboAvailComp.Items[cboAvailComp.ItemIndex],'^',1));
              Break;
            end;
        end;
    if Length(tQuantity.Text) > 0 then
      begin
        memOrder.Text := Responses.OrderText;
      end;
  finally
    aList.Free;
  end;
end;

procedure TfrmODBBank.tQuantityClick(Sender: TObject);
begin
  inherited;
  tQuantity.SelLength := 2;
  tQuantity.SelectAll;
end;

procedure TfrmODBBank.tQuantityEnter(Sender: TObject);
begin
  inherited;
  tQuantity.SelLength := 2;
  tQuantity.SelectAll;
end;

procedure TfrmODBBank.calCollTimeChange(Sender: TObject);
begin
  inherited;
  if uSelectedItems.Count > 0 then
    begin
      if cboCollType.ItemID = 'LC' then
        begin
          with cboCollTime do
            if Length(ItemID) > 0 then
              begin
                Responses.Update('START', 1, Copy(ItemID, 2, 999), Copy(ItemID, 2, 999));
                FLastLabCollTime := ItemID + U + Text;
              end
            else if Length(Text) > 0 then
              begin
                Responses.Update('START', 1, ValidCollTime(Text), Text) ;
                FLastLabCollTime := ValidCollTime(Text);
              end;
        end
      else
        begin
          with calCollTime do
            if FMDateTime > 0 then
              begin
                Responses.Update('START', 1, ValidCollTime(Text), Text);
                FLastColltime := ValidCollTime(Text);
              end
            else
              begin
                Responses.Update('START', 1, '', '') ;
                FLastCollTime := '';
              end;
        end;
      memOrder.Text := Responses.OrderText;
    end;
end;

end.
