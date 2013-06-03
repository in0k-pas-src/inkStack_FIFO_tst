unit TSTs_inkFIFO_CDv0_cutNodeDATA;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
   uTST_CORE_inkFIFO,
    inkFIFO;

type

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTSTCTC_inkFIFO_CDv0_cutNodeDATA= class(tTSTCTC_CORE_inkFIFO)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

 tTests_inkFIFO_CDv0_cutNodeDATA_ListOne=class(tTSTCTC_inkFIFO_CDv0_cutNodeDATA)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
  end;

 tTests_inkFIFO_CDv0_cutNodeDATA_ListTwo=class(tTSTCTC_inkFIFO_CDv0_cutNodeDATA)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
  end;

 tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX=class(tTSTCTC_inkFIFO_CDv0_cutNodeDATA)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
    procedure cutNodeIndex_4;
    procedure cutNodeIndex_5;
  end;

implementation

procedure tTSTCTC_inkFIFO_CDv0_cutNodeDATA.cutNode_OVER;
var cnt:NativeUint;
    tmp:pointer;
begin
    cnt:=TST_STACK_Count;
    //----
    tmp:=inkFIFO_cutNodeDATA(STACK,self);
    AssertNull  ('wrong result CUT'  ,tmp);
    AssertEquals('wrong lng afte CUT',cnt,TST_STACK_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkFIFO_CDv0_cutNodeDATA._TEST_(index:integer);
var tmp:pointer;
    tmD:pointer;
    cnt:NativeUint;
begin
    cnt:=TST_STACK_Count;
    tmp:=TST_STACK_getNODE(index);
    tmD:=TST_node_DATA(tmp);
    //--
    tmp:=inkFIFO_cutNodeDATA(STACK,tmD);
    //--
    AssertNotNull('wrong NOT cuted',tmp);
    AssertSame   ('wrong cuted NODE'     ,tmD  ,TST_node_DATA(tmp));
    AssertEquals ('wrong length afte CUT',cnt-1,TST_STACK_Count);
    //--
   _node_DST(tmp);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListOne.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(1);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListOne.cutNodeIndex_0;
begin
   _TEST_(0);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListTwo.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(2);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListTwo.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListTwo.cutNodeIndex_1;
begin
   _TEST_(1);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(6);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX.cutNodeIndex_1;
begin
   _TEST_(1);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX.cutNodeIndex_4;
begin
   _TEST_(4);
end;

procedure tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX.cutNodeIndex_5;
begin
   _TEST_(5);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv0_cutNodeDATA_ListOne);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv0_cutNodeDATA_ListTwo);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv0_cutNodeDATA_ListSiX);
end.

