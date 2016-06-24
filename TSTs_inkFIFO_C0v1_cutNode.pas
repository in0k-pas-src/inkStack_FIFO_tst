unit TSTs_inkFIFO_C0v1_cutNode;
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
 tTSTCTC_inkFIFO_C0v1_nodeCUT=class(tTSTCTC_CORE_inkFIFO)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

 tTests_inkFIFO_C0v1_nodeCUT_ListOne=class(tTSTCTC_inkFIFO_C0v1_nodeCUT)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
  end;

 tTests_inkFIFO_C0v1_nodeCUT_ListTwo=class(tTSTCTC_inkFIFO_C0v1_nodeCUT)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
  end;

 tTests_inkFIFO_C0v1_nodeCUT_ListSiX=class(tTSTCTC_inkFIFO_C0v1_nodeCUT)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
    procedure cutNodeIndex_4;
    procedure cutNodeIndex_5;
  end;

implementation

procedure tTSTCTC_inkFIFO_C0v1_nodeCUT.cutNode_OVER;
var cnt:NativeUint;
begin
    cnt:=TST_STACK_Count;
    //----
    inkFIFO_nodeCUT(STACK,self);
    AssertEquals('wrong lng afte CUT',cnt,TST_STACK_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkFIFO_C0v1_nodeCUT._TEST_(index:integer);
var tmp:pointer;
    cnt:NativeUint;
begin
    cnt:=TST_STACK_Count;
    tmp:=TST_STACK_getNODE(index);
    //--
    inkFIFO_nodeCUT(STACK,tmp);
    //--
    AssertNotNull('wrong NOT cuted',tmp);
    AssertEquals ('wrong length afte CUT',cnt-1,TST_STACK_Count);
    AssertEquals ('wrong cuted NODE'     ,index,TST_node_Nmbr(tmp));
    //--
   _node_DST(tmp);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_C0v1_nodeCUT_ListOne.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(1);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListOne.cutNodeIndex_0;
begin
   _TEST_(0);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_C0v1_nodeCUT_ListTwo.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(2);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListTwo.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListTwo.cutNodeIndex_1;
begin
   _TEST_(1);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_C0v1_nodeCUT_ListSiX.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(6);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListSiX.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListSiX.cutNodeIndex_1;
begin
   _TEST_(1);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListSiX.cutNodeIndex_4;
begin
   _TEST_(4);
end;

procedure tTests_inkFIFO_C0v1_nodeCUT_ListSiX.cutNodeIndex_5;
begin
   _TEST_(5);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_C0v1_nodeCUT_ListOne);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_C0v1_nodeCUT_ListTwo);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_C0v1_nodeCUT_ListSiX);
end.

