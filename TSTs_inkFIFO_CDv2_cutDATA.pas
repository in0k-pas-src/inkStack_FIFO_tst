unit TSTs_inkFIFO_CDv2_cutDATA;
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
 tTSTCTC_inkFIFO_CDv2_CutRES= class(tTSTCTC_CORE_inkFIFO)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

 tTests_inkFIFO_CDv2_CutRES_ListOne=class(tTSTCTC_inkFIFO_CDv2_CutRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
  end;

 tTests_inkFIFO_CDv2_CutRES_ListTwo=class(tTSTCTC_inkFIFO_CDv2_CutRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
  end;

 tTests_inkFIFO_CDv2_CutRES_ListSiX=class(tTSTCTC_inkFIFO_CDv2_CutRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
    procedure cutNodeIndex_4;
    procedure cutNodeIndex_5;
  end;

implementation

procedure tTSTCTC_inkFIFO_CDv2_CutRES.cutNode_OVER;
var cnt:NativeUint;
    l  :boolean;
begin
    cnt:=TST_STACK_Count;
    //----
    l:=inkFIFO_CutRES(STACK,self);
    AssertFalse ('wrong result CUT'  ,l);
    AssertEquals('wrong lng afte CUT',cnt,TST_STACK_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkFIFO_CDv2_CutRES._TEST_(index:integer);
var tmp:pointer;
    l  :boolean;
    cnt:NativeUint;
begin
    cnt:=TST_STACK_Count;
    tmp:=TST_STACK_getNODE(index);
    tmp:=TST_node_DATA(tmp);
    //--
    l:=inkFIFO_CutRES(STACK,tmp);
    //--
    AssertTrue   ('wrong NOT cuted',l);
    AssertEquals ('wrong length afte CUT',cnt-1,TST_STACK_Count);
    //--
    TST_data_DESTROY(tmp);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv2_CutRES_ListOne.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(1);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListOne.cutNodeIndex_0;
begin
   _TEST_(0);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv2_CutRES_ListTwo.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(2);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListTwo.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListTwo.cutNodeIndex_1;
begin
   _TEST_(1);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv2_CutRES_ListSiX.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(6);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListSiX.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListSiX.cutNodeIndex_1;
begin
   _TEST_(1);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListSiX.cutNodeIndex_4;
begin
   _TEST_(4);
end;

procedure tTests_inkFIFO_CDv2_CutRES_ListSiX.cutNodeIndex_5;
begin
   _TEST_(5);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv2_CutRES_ListOne);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv2_CutRES_ListTwo);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv2_CutRES_ListSiX);
end.

