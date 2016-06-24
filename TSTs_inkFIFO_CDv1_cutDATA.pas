unit TSTs_inkFIFO_CDv1_cutDATA;
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
 tTSTCTC_inkFIFO_CDv1_CUT= class(tTSTCTC_CORE_inkFIFO)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

 tTests_inkFIFO_CDv1_CUT_ListOne=class(tTSTCTC_inkFIFO_CDv1_CUT)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
  end;

 tTests_inkFIFO_CDv1_CUT_ListTwo=class(tTSTCTC_inkFIFO_CDv1_CUT)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
  end;

 tTests_inkFIFO_CDv1_CUT_ListSiX=class(tTSTCTC_inkFIFO_CDv1_CUT)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
    procedure cutNodeIndex_4;
    procedure cutNodeIndex_5;
  end;

implementation

procedure tTSTCTC_inkFIFO_CDv1_CUT.cutNode_OVER;
var cnt:NativeUint;
begin
    cnt:=TST_STACK_Count;
    //----
    inkFIFO_CUT(STACK,self);
    AssertEquals('wrong lng afte CUT',cnt,TST_STACK_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkFIFO_CDv1_CUT._TEST_(index:integer);
var tmp:pointer;
    cnt:NativeUint;
begin
    cnt:=TST_STACK_Count;
    tmp:=TST_STACK_getNODE(index);
    tmp:=TST_node_DATA(tmp);
    //--
    inkFIFO_CUT(STACK,tmp);
    //--
    AssertEquals ('wrong length afte CUT',cnt-1,TST_STACK_Count);
    //--
    TST_data_DESTROY(tmp);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv1_CUT_ListOne.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(1);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListOne.cutNodeIndex_0;
begin
   _TEST_(0);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv1_CUT_ListTwo.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(2);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListTwo.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListTwo.cutNodeIndex_1;
begin
   _TEST_(1);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_CDv1_CUT_ListSiX.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(6);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListSiX.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListSiX.cutNodeIndex_1;
begin
   _TEST_(1);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListSiX.cutNodeIndex_4;
begin
   _TEST_(4);
end;

procedure tTests_inkFIFO_CDv1_CUT_ListSiX.cutNodeIndex_5;
begin
   _TEST_(5);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv1_CUT_ListOne);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv1_CUT_ListTwo);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_CDv1_CUT_ListSiX);
end.

