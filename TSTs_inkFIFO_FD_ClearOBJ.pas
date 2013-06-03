unit TSTs_inkFIFO_FD_ClearOBJ;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkFIFO,
     inkStack_node, inkFIFO;

type

 tTests_inkFIFO_FD_ClearOBJ=class(tTSTCTC_CORE_inkFIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

type
  tTest_class=class
  public
    destructor DESTROY; override;
  end;

destructor tTest_class.DESTROY;
begin
    inherited;
end;

//------------------------------------------------------------------------------

procedure tTests_inkFIFO_FD_ClearOBJ.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkFIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FD_ClearOBJ.Clear_One;
begin
    STACK:=TST_node_Create(tTest_class.Create,nil);
    pInkStack(STACK)^.next:=STACK;
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FD_ClearOBJ.Clear_Two;
var last:pointer;
begin
    last :=TST_node_Create(tTest_class.Create,nil);
    STACK:=TST_node_Create(tTest_class.Create,last);
    pInkStack(last)^.next:=STACK;
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkFIFO_FD_ClearOBJ.Clear_Six;
var last:pointer;
begin
    last :=TST_node_Create(tTest_class.Create,nil);
    STACK:=TST_node_Create(tTest_class.Create,last);
    STACK:=TST_node_Create(tTest_class.Create,STACK);
    STACK:=TST_node_Create(tTest_class.Create,STACK);
    STACK:=TST_node_Create(tTest_class.Create,STACK);
    STACK:=TST_node_Create(tTest_class.Create,STACK);
    pInkStack(last)^.next:=STACK;
    //---
    inkFIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkFIFO,tTests_inkFIFO_FD_ClearOBJ);
end.
