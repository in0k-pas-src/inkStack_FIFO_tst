unit TSTs_inkFIFO_C0v2_cutNode;
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
 tTSTCTC_inkFIFO_C0v2_nodeCutRES= class(tTSTCTC_CORE_inkFIFO)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

 tTests_inkFIFO_C0v2_nodeCutRES_ListOne=class(tTSTCTC_inkFIFO_C0v2_nodeCutRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
  end;

 tTests_inkFIFO_C0v2_nodeCutRES_ListTwo=class(tTSTCTC_inkFIFO_C0v2_nodeCutRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
  end;

 tTests_inkFIFO_C0v2_nodeCutRES_ListSiX=class(tTSTCTC_inkFIFO_C0v2_nodeCutRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
    procedure cutNodeIndex_4;
    procedure cutNodeIndex_5;
  end;

implementation

procedure tTSTCTC_inkFIFO_C0v2_nodeCutRES.cutNode_OVER;
var cnt:NativeUint;
    l  :boolean;
begin
    cnt:=TST_STACK_Count;
    //----
    l:=inkFIFO_nodeCutRES(STACK,self);
    AssertFalse ('wrong result CUT fnk',l);
    AssertEquals('wrong lng afte CUT',cnt,TST_STACK_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkFIFO_C0v2_nodeCutRES._TEST_(index:integer);
var tmp:pointer;
    cnt:NativeUint;
    l  :boolean;
begin
    cnt:=TST_STACK_Count;
    tmp:=TST_STACK_getNODE(index);
    //--
    l:=inkFIFO_nodeCutRES(STACK,tmp);
    //--
    AssertTRUE   ('wrong result CUT fnk',l);
    AssertNotNull('wrong NOT cuted',tmp);
    AssertEquals ('wrong length afte CUT',cnt-1,TST_STACK_Count);
    AssertEquals ('wrong cuted NODE'     ,index,TST_node_Nmbr(tmp));
    //--
   _node_DST(tmp);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListOne.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(1);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListOne.cutNodeIndex_0;
begin
   _TEST_(0);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListTwo.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(2);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListTwo.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListTwo.cutNodeIndex_1;
begin
   _TEST_(1);
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListSiX.SetUp;
begin
   inherited;
   STACK:=TST_stack_Create(6);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListSiX.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListSiX.cutNodeIndex_1;
begin
   _TEST_(1);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListSiX.cutNodeIndex_4;
begin
   _TEST_(4);
end;

procedure tTests_inkFIFO_C0v2_nodeCutRES_ListSiX.cutNodeIndex_5;
begin
   _TEST_(5);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_C0v2_nodeCutRES_ListOne);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_C0v2_nodeCutRES_ListTwo);
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_C0v2_nodeCutRES_ListSiX);
end.

